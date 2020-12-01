-- Revert: schemas/meta_public/tables/site_modules/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".site_modules FROM authenticated;
COMMIT;  

