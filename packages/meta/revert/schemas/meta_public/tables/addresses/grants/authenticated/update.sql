-- Revert: schemas/meta_public/tables/addresses/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".addresses FROM authenticated;
COMMIT;  

