-- Verify: schemas/meta_public/tables/site_themes/policies/authenticated_can_insert_on_site_themes on pg

BEGIN;
SELECT verify_policy('authenticated_can_insert_on_site_themes', 'meta_public.site_themes');
COMMIT;  

