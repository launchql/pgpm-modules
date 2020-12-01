-- Verify: schemas/meta_public/tables/api_modules/policies/authenticated_can_insert_on_api_modules on pg

BEGIN;
SELECT verify_policy('authenticated_can_insert_on_api_modules', 'meta_public.api_modules');
COMMIT;  

