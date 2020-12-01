-- Deploy: schemas/meta_encrypted_secrets/procedures/del/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/table
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/user_id/column

BEGIN;

CREATE FUNCTION "meta_encrypted_secrets".del(
  user_id uuid,
  secret_name text
)
  RETURNS void
  AS $$
BEGIN
  DELETE FROM "meta_encrypted_secrets".user_encrypted_secrets s
  WHERE s.user_id = del.user_id
    AND s.name = del.secret_name;
END
$$
LANGUAGE 'plpgsql'
VOLATILE;
CREATE FUNCTION "meta_encrypted_secrets".del(
  user_id uuid,
  secret_names text[]
)
  RETURNS void
  AS $$
BEGIN
  DELETE FROM "meta_encrypted_secrets".user_encrypted_secrets s
  WHERE s.user_id = del.user_id
    AND s.name = ANY(del.secret_names);
END
$$
LANGUAGE 'plpgsql'
VOLATILE;
GRANT EXECUTE ON FUNCTION "meta_encrypted_secrets".del(uuid,text) TO authenticated;
GRANT EXECUTE ON FUNCTION "meta_encrypted_secrets".del(uuid,text[]) TO authenticated;
COMMIT;
