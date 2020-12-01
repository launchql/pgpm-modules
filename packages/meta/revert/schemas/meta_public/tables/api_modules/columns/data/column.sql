-- Revert: schemas/meta_public/tables/api_modules/columns/data/column from pg

BEGIN;


ALTER TABLE "meta_public".api_modules DROP COLUMN data;
COMMIT;  

