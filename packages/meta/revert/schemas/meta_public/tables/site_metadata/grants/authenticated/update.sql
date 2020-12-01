-- Revert: schemas/meta_public/tables/site_metadata/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".site_metadata FROM authenticated;
COMMIT;  

