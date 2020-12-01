-- Revert: schemas/meta_public/tables/site_modules/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".site_modules DROP COLUMN id;
COMMIT;  

