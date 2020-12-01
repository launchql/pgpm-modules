-- Revert: schemas/meta_public/tables/sites/columns/dbname/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN dbname;
COMMIT;  

