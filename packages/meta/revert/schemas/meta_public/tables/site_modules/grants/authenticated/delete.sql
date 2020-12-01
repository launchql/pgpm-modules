-- Revert: schemas/meta_public/tables/site_modules/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".site_modules FROM authenticated;
COMMIT;  

