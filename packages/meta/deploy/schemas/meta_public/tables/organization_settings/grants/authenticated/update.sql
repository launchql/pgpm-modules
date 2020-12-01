-- Deploy: schemas/meta_public/tables/organization_settings/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/organization_settings/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".organization_settings TO authenticated;
COMMIT;
