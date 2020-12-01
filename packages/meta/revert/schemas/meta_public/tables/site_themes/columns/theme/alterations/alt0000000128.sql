-- Revert: schemas/meta_public/tables/site_themes/columns/theme/alterations/alt0000000128 from pg

BEGIN;


ALTER TABLE "meta_public".site_themes 
    ALTER COLUMN theme DROP NOT NULL;


COMMIT;  

