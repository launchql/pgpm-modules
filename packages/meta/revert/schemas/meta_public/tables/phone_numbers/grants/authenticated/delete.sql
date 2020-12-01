-- Revert: schemas/meta_public/tables/phone_numbers/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".phone_numbers FROM authenticated;
COMMIT;  

