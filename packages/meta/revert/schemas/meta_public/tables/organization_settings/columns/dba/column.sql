-- Revert: schemas/meta_public/tables/organization_settings/columns/dba/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN dba;
COMMIT;  

