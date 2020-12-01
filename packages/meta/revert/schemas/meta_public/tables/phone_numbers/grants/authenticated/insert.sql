-- Revert: schemas/meta_public/tables/phone_numbers/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".phone_numbers FROM authenticated;
COMMIT;  

