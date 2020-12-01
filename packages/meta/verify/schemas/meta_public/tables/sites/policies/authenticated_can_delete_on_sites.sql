-- Verify: schemas/meta_public/tables/sites/policies/authenticated_can_delete_on_sites on pg

BEGIN;
SELECT verify_policy('authenticated_can_delete_on_sites', 'meta_public.sites');
COMMIT;  

