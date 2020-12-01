-- Revert: schemas/meta_public/tables/site_metadata/columns/site_id/column from pg

BEGIN;


ALTER TABLE "meta_public".site_metadata DROP COLUMN site_id;
COMMIT;  

