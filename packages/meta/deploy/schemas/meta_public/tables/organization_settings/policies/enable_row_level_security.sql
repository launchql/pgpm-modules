-- Deploy: schemas/meta_public/tables/organization_settings/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/organization_settings/table

BEGIN;

ALTER TABLE "meta_public".organization_settings
    ENABLE ROW LEVEL SECURITY;
COMMIT;
