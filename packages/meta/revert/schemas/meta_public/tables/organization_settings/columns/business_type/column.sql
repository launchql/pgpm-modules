-- Revert: schemas/meta_public/tables/organization_settings/columns/business_type/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN business_type;
COMMIT;  

