-- Revert: schemas/meta_public/tables/api_modules/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".api_modules FROM authenticated;
COMMIT;  

