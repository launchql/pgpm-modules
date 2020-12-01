-- Revert: schemas/meta_public/tables/organization_settings/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".organization_settings FROM authenticated;
COMMIT;  

