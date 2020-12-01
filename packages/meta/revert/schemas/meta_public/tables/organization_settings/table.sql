-- Revert: schemas/meta_public/tables/organization_settings/table from pg

BEGIN;
DROP TABLE "meta_public".organization_settings;
COMMIT;  

