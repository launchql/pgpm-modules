-- Deploy: schemas/meta_public/tables/organization_settings/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/organization_settings/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".organization_settings TO authenticated;
COMMIT;
