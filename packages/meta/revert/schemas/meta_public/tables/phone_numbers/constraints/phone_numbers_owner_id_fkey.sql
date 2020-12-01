-- Revert: schemas/meta_public/tables/phone_numbers/constraints/phone_numbers_owner_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers 
    DROP CONSTRAINT phone_numbers_owner_id_fkey;

COMMIT;  

