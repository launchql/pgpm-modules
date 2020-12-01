-- Revert: schemas/meta_public/tables/organization_settings/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".organization_settings FROM authenticated;
COMMIT;  

