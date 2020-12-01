-- Revert: schemas/meta_public/tables/site_themes/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".site_themes FROM authenticated;
COMMIT;  

