-- Revert: schemas/meta_public/tables/site_metadata/columns/og_image/column from pg

BEGIN;


ALTER TABLE "meta_public".site_metadata DROP COLUMN og_image;
COMMIT;  

