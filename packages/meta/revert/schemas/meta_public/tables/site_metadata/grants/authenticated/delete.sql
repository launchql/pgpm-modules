-- Revert: schemas/meta_public/tables/site_metadata/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".site_metadata FROM authenticated;
COMMIT;  

