-- Verify: schemas/meta_public/tables/organization_settings/policies/authenticated_can_delete_on_organization_settings on pg

BEGIN;
SELECT verify_policy('authenticated_can_delete_on_organization_settings', 'meta_public.organization_settings');
COMMIT;  

