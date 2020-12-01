-- Revert: schemas/meta_public/tables/organization_settings/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".organization_settings FROM authenticated;
COMMIT;  

