-- Revert: schemas/meta_public/tables/site_metadata/columns/description/column from pg

BEGIN;


ALTER TABLE "meta_public".site_metadata DROP COLUMN description;
COMMIT;  

