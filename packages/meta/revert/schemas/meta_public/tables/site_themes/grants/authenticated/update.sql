-- Revert: schemas/meta_public/tables/site_themes/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".site_themes FROM authenticated;
COMMIT;  

