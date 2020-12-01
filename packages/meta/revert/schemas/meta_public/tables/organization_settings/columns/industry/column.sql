-- Revert: schemas/meta_public/tables/organization_settings/columns/industry/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN industry;
COMMIT;  

