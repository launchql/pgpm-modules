-- Verify: schemas/meta_public/tables/site_modules/policies/authenticated_can_update_on_site_modules on pg

BEGIN;
SELECT verify_policy('authenticated_can_update_on_site_modules', 'meta_public.site_modules');
COMMIT;  

