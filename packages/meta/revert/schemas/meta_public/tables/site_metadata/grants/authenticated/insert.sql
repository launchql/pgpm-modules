-- Revert: schemas/meta_public/tables/site_metadata/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".site_metadata FROM authenticated;
COMMIT;  

