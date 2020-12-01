-- Revert: schemas/meta_public/tables/api_modules/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".api_modules FROM authenticated;
COMMIT;  

