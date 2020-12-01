-- Revert: schemas/meta_public/tables/site_themes/constraints/site_themes_site_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".site_themes 
    DROP CONSTRAINT site_themes_site_id_fkey;

COMMIT;  

