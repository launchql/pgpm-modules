-- Deploy: schemas/meta_encrypted_secrets/procedures/set/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/table
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/enc/column
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/value/column
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/user_id/column

BEGIN;

CREATE FUNCTION "meta_encrypted_secrets".set (
  v_user_id uuid,
  secret_name text,
  secret_value text,
  field_encoding text = 'pgp'
)
  RETURNS boolean
  AS $$
BEGIN
  INSERT INTO "meta_encrypted_secrets".user_encrypted_secrets (user_id, name, value, enc)
    VALUES (v_user_id, set.secret_name, set.secret_value::bytea, set.field_encoding)
    ON CONFLICT (user_id, name)
    DO
    UPDATE
    SET
      value = set.secret_value::bytea,
      enc = EXCLUDED.enc;
  RETURN TRUE;
END
$$
LANGUAGE 'plpgsql'
VOLATILE;
GRANT EXECUTE ON FUNCTION "meta_encrypted_secrets".set TO authenticated;
COMMIT;
