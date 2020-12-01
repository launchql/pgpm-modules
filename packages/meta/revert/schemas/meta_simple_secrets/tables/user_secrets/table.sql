-- Revert: schemas/meta_simple_secrets/tables/user_secrets/table from pg

BEGIN;
DROP TABLE "meta_simple_secrets".user_secrets;
COMMIT;  

