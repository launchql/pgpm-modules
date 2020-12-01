-- Revert: schemas/meta_public/tables/site_modules/policies/authenticated_can_update_on_site_modules from pg

BEGIN;
DROP POLICY authenticated_can_update_on_site_modules ON "meta_public".site_modules;
COMMIT;  

