-- Revert: schemas/meta_public/tables/site_metadata/columns/title/column from pg

BEGIN;


ALTER TABLE "meta_public".site_metadata DROP COLUMN title;
COMMIT;  

