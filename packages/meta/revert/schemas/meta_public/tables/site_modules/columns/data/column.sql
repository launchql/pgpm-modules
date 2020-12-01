-- Revert: schemas/meta_public/tables/site_modules/columns/data/column from pg

BEGIN;


ALTER TABLE "meta_public".site_modules DROP COLUMN data;
COMMIT;  

