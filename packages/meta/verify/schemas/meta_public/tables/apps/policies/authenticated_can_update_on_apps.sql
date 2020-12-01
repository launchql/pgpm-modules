-- Verify: schemas/meta_public/tables/apps/policies/authenticated_can_update_on_apps on pg

BEGIN;
SELECT verify_policy('authenticated_can_update_on_apps', 'meta_public.apps');
COMMIT;  

