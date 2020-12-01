-- Revert: schemas/meta_public/tables/addresses/policies/authenticated_can_select_on_addresses from pg

BEGIN;
DROP POLICY authenticated_can_select_on_addresses ON "meta_public".addresses;
COMMIT;  

