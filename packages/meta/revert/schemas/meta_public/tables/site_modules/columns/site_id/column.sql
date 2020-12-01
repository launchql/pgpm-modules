-- Revert: schemas/meta_public/tables/site_modules/columns/site_id/column from pg

BEGIN;


ALTER TABLE "meta_public".site_modules DROP COLUMN site_id;
COMMIT;  

