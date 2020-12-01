-- Revert: schemas/meta_public/tables/sites/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".sites FROM authenticated;
COMMIT;  

