-- Verify: schemas/meta_public/tables/site_metadata/policies/authenticated_can_select_on_site_metadata on pg

BEGIN;
SELECT verify_policy('authenticated_can_select_on_site_metadata', 'meta_public.site_metadata');
COMMIT;  

