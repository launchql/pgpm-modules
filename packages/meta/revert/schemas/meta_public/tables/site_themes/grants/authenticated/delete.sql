-- Revert: schemas/meta_public/tables/site_themes/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".site_themes FROM authenticated;
COMMIT;  

