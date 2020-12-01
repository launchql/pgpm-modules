-- Revert: schemas/meta_public/tables/organization_settings/columns/description/column from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN description;
COMMIT;  

