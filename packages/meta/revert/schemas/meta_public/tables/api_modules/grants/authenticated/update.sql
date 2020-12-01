-- Revert: schemas/meta_public/tables/api_modules/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".api_modules FROM authenticated;
COMMIT;  

