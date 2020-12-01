-- Verify: schemas/meta_public/tables/addresses/policies/authenticated_can_insert_on_addresses on pg

BEGIN;
SELECT verify_policy('authenticated_can_insert_on_addresses', 'meta_public.addresses');
COMMIT;  

