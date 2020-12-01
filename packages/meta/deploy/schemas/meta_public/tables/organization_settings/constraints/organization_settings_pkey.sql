-- Deploy: schemas/meta_public/tables/organization_settings/constraints/organization_settings_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/organization_settings/table

BEGIN;

ALTER TABLE "meta_public".organization_settings
    ADD CONSTRAINT organization_settings_pkey PRIMARY KEY (id);
COMMIT;
