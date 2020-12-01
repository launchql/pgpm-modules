-- Revert: schemas/meta_public/tables/organization_settings/columns/address_id/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN address_id;
COMMIT;  

