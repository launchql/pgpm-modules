-- Revert: schemas/meta_public/tables/domains/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".domains FROM authenticated;
COMMIT;  

