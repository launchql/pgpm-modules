-- Revert: schemas/meta_public/tables/organization_settings/columns/id/alterations/alt0000000068 from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

