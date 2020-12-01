-- Revert: schemas/meta_public/tables/site_metadata/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".site_metadata FROM authenticated;
COMMIT;  

