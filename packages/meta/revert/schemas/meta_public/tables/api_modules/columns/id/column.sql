-- Revert: schemas/meta_public/tables/api_modules/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".api_modules DROP COLUMN id;
COMMIT;  

