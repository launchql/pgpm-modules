-- Revert: schemas/meta_public/tables/organization_settings/columns/legal_name/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN legal_name;
COMMIT;  

