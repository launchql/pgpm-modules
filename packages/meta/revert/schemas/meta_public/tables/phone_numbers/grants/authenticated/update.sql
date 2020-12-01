-- Revert: schemas/meta_public/tables/phone_numbers/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".phone_numbers FROM authenticated;
COMMIT;  

