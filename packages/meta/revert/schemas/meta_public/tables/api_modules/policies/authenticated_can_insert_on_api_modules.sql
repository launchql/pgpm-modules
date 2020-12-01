-- Revert: schemas/meta_public/tables/api_modules/policies/authenticated_can_insert_on_api_modules from pg

BEGIN;
DROP POLICY authenticated_can_insert_on_api_modules ON "meta_public".api_modules;
COMMIT;  

