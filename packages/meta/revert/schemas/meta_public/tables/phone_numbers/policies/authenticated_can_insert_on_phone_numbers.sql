-- Revert: schemas/meta_public/tables/phone_numbers/policies/authenticated_can_insert_on_phone_numbers from pg

BEGIN;
DROP POLICY authenticated_can_insert_on_phone_numbers ON "meta_public".phone_numbers;
COMMIT;  

