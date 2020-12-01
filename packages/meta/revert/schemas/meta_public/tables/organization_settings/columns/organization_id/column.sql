-- Revert: schemas/meta_public/tables/organization_settings/columns/organization_id/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN organization_id;
COMMIT;  

