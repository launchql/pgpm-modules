-- Revert: schemas/meta_public/tables/organization_settings/columns/phone_id/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN phone_id;
COMMIT;  

