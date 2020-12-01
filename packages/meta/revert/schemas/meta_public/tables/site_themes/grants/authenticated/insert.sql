-- Revert: schemas/meta_public/tables/site_themes/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".site_themes FROM authenticated;
COMMIT;  

