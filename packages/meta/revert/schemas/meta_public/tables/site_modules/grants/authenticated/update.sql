-- Revert: schemas/meta_public/tables/site_modules/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".site_modules FROM authenticated;
COMMIT;  

