-- Revert: schemas/meta_public/tables/site_themes/columns/site_id/column from pg

BEGIN;


ALTER TABLE "meta_public".site_themes DROP COLUMN site_id;
COMMIT;  

