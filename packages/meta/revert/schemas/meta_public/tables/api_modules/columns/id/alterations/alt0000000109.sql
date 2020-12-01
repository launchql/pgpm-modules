-- Revert: schemas/meta_public/tables/api_modules/columns/id/alterations/alt0000000109 from pg

BEGIN;


ALTER TABLE "meta_public".api_modules 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

