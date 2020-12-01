-- Revert: schemas/meta_public/tables/addresses/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".addresses FROM authenticated;
COMMIT;  

