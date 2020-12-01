-- Revert: schemas/meta_public/tables/domains/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".domains FROM authenticated;
COMMIT;  

