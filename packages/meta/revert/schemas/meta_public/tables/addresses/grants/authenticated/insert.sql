-- Revert: schemas/meta_public/tables/addresses/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".addresses FROM authenticated;
COMMIT;  

