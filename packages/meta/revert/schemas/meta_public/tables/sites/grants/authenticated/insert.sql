-- Revert: schemas/meta_public/tables/sites/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".sites FROM authenticated;
COMMIT;  

