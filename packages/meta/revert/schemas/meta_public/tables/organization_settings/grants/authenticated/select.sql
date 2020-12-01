-- Revert: schemas/meta_public/tables/organization_settings/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".organization_settings FROM authenticated;
COMMIT;  

