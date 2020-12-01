-- Revert: schemas/meta_public/tables/phone_numbers/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".phone_numbers FROM authenticated;
COMMIT;  

