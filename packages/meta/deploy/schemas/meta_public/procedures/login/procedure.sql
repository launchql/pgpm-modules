-- Deploy: schemas/meta_public/procedures/login/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_public/tables/emails/table
-- requires: schemas/meta_private/tables/api_tokens/table
-- requires: schemas/meta_simple_secrets/tables/user_secrets/table

BEGIN;

CREATE FUNCTION "meta_public".login (
  email text,
  PASSWORD text
)
  RETURNS "meta_private".api_tokens
  AS $$
DECLARE
  v_token "meta_private".api_tokens;
  v_email "meta_public".emails;
  v_sign_in_attempt_window_duration interval = interval '6 hours';
  v_sign_in_max_attempts int = 10;
  first_failed_password_attempt timestamptz;
  password_attempts int;
BEGIN
  SELECT
    user_emails_alias.*
  FROM
    "meta_public".emails AS user_emails_alias
  WHERE
    user_emails_alias.email = login.email::email INTO v_email;
  
  IF (NOT FOUND) THEN
    RETURN NULL;
  END IF;
  SELECT value FROM "meta_simple_secrets".user_secrets t 
    WHERE t.user_id = v_email.user_id
    AND t.name = 'first_failed_password_attempt'
  INTO first_failed_password_attempt;
  
  SELECT value FROM "meta_simple_secrets".user_secrets t 
    WHERE t.user_id = v_email.user_id
    AND t.name = 'password_attempts'
  INTO password_attempts;
  IF (
    first_failed_password_attempt IS NOT NULL
      AND
    first_failed_password_attempt > NOW() - v_sign_in_attempt_window_duration
      AND
    password_attempts >= v_sign_in_max_attempts
  ) THEN
    RAISE EXCEPTION 'ACCOUNT_LOCKED_EXCEED_ATTEMPTS';
  END IF;
  IF ("meta_encrypted_secrets".verify(v_email.user_id, 'password_hash', PASSWORD)) THEN
    DELETE FROM "meta_simple_secrets".user_secrets s 
      WHERE
      s.user_id = v_email.user_id
      AND s.name IN ('password_attempts', 'first_failed_password_attempt');
    INSERT INTO "meta_private".api_tokens (user_id)
      VALUES (v_email.user_id)
    RETURNING
      * INTO v_token;
    RETURN v_token;
  ELSE
    IF (password_attempts IS NULL) THEN
      password_attempts = 0;
    END IF;
    IF (
      first_failed_password_attempt IS NULL
        OR
      first_failed_password_attempt < NOW() - v_sign_in_attempt_window_duration
    ) THEN
      password_attempts = 1;
      first_failed_password_attempt = NOW();
    ELSE 
      password_attempts = password_attempts + 1;
    END IF;
    INSERT INTO "meta_simple_secrets".user_secrets 
      (user_id, name, value)
    VALUES
      (v_email.user_id, 'password_attempts', password_attempts),
      (v_email.user_id, 'first_failed_password_attempt', first_failed_password_attempt)
    ON CONFLICT (user_id, name)
    DO UPDATE 
    SET value = EXCLUDED.value;
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE 'plpgsql'
STRICT
SECURITY DEFINER;
GRANT EXECUTE ON FUNCTION "meta_public".login TO anonymous;
COMMIT;
