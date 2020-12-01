-- Revert: schemas/meta_public/tables/api_modules/columns/api_id/column from pg

BEGIN;


ALTER TABLE "meta_public".api_modules DROP COLUMN api_id;
COMMIT;  

