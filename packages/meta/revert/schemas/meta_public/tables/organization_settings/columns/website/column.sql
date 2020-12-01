-- Revert: schemas/meta_public/tables/organization_settings/columns/website/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN website;
COMMIT;  

