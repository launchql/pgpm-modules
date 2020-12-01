-- Revert: schemas/meta_simple_secrets/tables/user_secrets/columns/user_id/column from pg

BEGIN;


ALTER TABLE "meta_simple_secrets".user_secrets DROP COLUMN user_id;
COMMIT;  

