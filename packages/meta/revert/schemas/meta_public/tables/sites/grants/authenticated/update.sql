-- Revert: schemas/meta_public/tables/sites/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".sites FROM authenticated;
COMMIT;  

