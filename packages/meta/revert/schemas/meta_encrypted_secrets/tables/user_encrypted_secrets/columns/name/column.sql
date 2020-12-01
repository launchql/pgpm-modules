-- Revert: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/name/column from pg

BEGIN;


ALTER TABLE "meta_encrypted_secrets".user_encrypted_secrets DROP COLUMN name;
COMMIT;  

