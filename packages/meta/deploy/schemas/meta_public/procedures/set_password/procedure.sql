-- Deploy: schemas/meta_public/procedures/set_password/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_public/tables/users/table
-- requires: schemas/meta_simple_secrets/tables/user_secrets/table

BEGIN;

CREATE FUNCTION "meta_public".set_password (
  new_password text
)
  RETURNS boolean
  AS $$
DECLARE
  v_user "meta_public".users;
  v_user_secret "meta_simple_secrets".user_secrets;
BEGIN
  IF (new_password IS NULL OR character_length(new_password) <= 7) THEN 
    RAISE EXCEPTION 'PASSWORD_LEN';
  END IF;
  SELECT
    u.* INTO v_user
  FROM
    "meta_public".users AS u
  WHERE
    id = "meta_public".get_current_user_id ();
  IF (NOT FOUND) THEN
    RETURN FALSE;
  END IF;
  PERFORM "meta_encrypted_secrets".set
    (v_user.id, 'password_hash', new_password, 'crypt');
  DELETE FROM "meta_simple_secrets".user_secrets s 
    WHERE
    s.user_id = v_user.id
    AND s.name IN
      (
        'password_attempts',
        'first_failed_password_attempt',
        'reset_password_token_generated',
        'reset_password_attempts',
        'first_failed_reset_password_attempt'
      );
  DELETE FROM "meta_encrypted_secrets".user_encrypted_secrets s 
    WHERE
    s.user_id = v_user.id
    AND s.name IN
      (
        'reset_password_token'
      );
      
  RETURN TRUE;
END;
$$
LANGUAGE 'plpgsql'
VOLATILE;
GRANT EXECUTE ON FUNCTION "meta_public".set_password TO authenticated;
COMMIT;
