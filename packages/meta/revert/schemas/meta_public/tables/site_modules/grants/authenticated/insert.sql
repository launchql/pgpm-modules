-- Revert: schemas/meta_public/tables/site_modules/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".site_modules FROM authenticated;
COMMIT;  

