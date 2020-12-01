-- Revert: schemas/meta_public/tables/domains/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".domains FROM authenticated;
COMMIT;  

