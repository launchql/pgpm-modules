-- Verify: schemas/meta_public/tables/domains/policies/authenticated_can_update_on_domains on pg

BEGIN;
SELECT verify_policy('authenticated_can_update_on_domains', 'meta_public.domains');
COMMIT;  

