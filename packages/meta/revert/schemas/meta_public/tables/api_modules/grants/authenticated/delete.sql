-- Revert: schemas/meta_public/tables/api_modules/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".api_modules FROM authenticated;
COMMIT;  

