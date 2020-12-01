-- Deploy: schemas/meta_encrypted_secrets/procedures/verify/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/table
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/enc/column
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/user_id/column

BEGIN;

CREATE FUNCTION "meta_encrypted_secrets".verify (
  user_id uuid,
  secret_name text,
  secret_value text
)
  RETURNS boolean
  AS $$
DECLARE
  v_secret_text text;
  v_secret "meta_encrypted_secrets".user_encrypted_secrets;
BEGIN
  SELECT
    *
  FROM
    "meta_encrypted_secrets".get (verify.user_id, verify.secret_name)
  INTO v_secret_text;
  SELECT
    *
  FROM
    "meta_encrypted_secrets".user_encrypted_secrets s
  WHERE
    s.name = verify.secret_name
    AND s.user_id = verify.user_id INTO v_secret;
  IF (v_secret.enc = 'crypt') THEN
    RETURN v_secret_text = crypt(verify.secret_value::bytea::text, v_secret_text);
  ELSIF (v_secret.enc = 'pgp') THEN
    RETURN verify.secret_value = v_secret_text;
  END IF;
  RETURN verify.secret_value = v_secret_text;
END
$$
LANGUAGE 'plpgsql'
STABLE;
GRANT EXECUTE ON FUNCTION "meta_encrypted_secrets".verify TO authenticated;
COMMIT;
