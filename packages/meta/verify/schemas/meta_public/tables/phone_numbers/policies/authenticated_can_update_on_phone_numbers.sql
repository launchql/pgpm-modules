-- Verify: schemas/meta_public/tables/phone_numbers/policies/authenticated_can_update_on_phone_numbers on pg

BEGIN;
SELECT verify_policy('authenticated_can_update_on_phone_numbers', 'meta_public.phone_numbers');
COMMIT;  

