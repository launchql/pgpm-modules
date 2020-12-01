-- Revert: schemas/meta_public/tables/sites/columns/og_image/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN og_image;
COMMIT;  

