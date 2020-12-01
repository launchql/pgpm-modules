-- Deploy: schemas/meta_public/tables/organization_settings/indexes/organization_settings_organization_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/organization_settings/table

BEGIN;

CREATE INDEX organization_settings_organization_id_idx ON "meta_public".organization_settings (organization_id);
COMMIT;
