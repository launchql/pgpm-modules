-- Revert: schemas/meta_public/tables/site_modules/columns/name/column from pg

BEGIN;


ALTER TABLE "meta_public".site_modules DROP COLUMN name;
COMMIT;  

