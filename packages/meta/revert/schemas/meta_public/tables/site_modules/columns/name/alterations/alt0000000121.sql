-- Revert: schemas/meta_public/tables/site_modules/columns/name/alterations/alt0000000121 from pg

BEGIN;


ALTER TABLE "meta_public".site_modules 
    ALTER COLUMN name DROP NOT NULL;


COMMIT;  

