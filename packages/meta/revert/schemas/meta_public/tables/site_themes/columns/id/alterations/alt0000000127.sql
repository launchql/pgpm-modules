-- Revert: schemas/meta_public/tables/site_themes/columns/id/alterations/alt0000000127 from pg

BEGIN;


ALTER TABLE "meta_public".site_themes 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

