-- Revert: schemas/meta_public/tables/apps/columns/id/alterations/alt0000000140 from pg

BEGIN;


ALTER TABLE "meta_public".apps 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

