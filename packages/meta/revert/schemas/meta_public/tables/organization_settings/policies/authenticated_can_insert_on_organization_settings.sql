-- Revert: schemas/meta_public/tables/organization_settings/policies/authenticated_can_insert_on_organization_settings from pg

BEGIN;
DROP POLICY authenticated_can_insert_on_organization_settings ON "meta_public".organization_settings;
COMMIT;  

