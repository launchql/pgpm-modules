-- Deploy: schemas/meta_public/tables/organization_settings/constraints/organization_settings_organization_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table
-- requires: schemas/meta_public/tables/users/columns/id/column
-- requires: schemas/meta_public/tables/organization_settings/table
-- requires: schemas/meta_public/tables/organization_settings/columns/organization_id/column

BEGIN;

ALTER TABLE "meta_public".organization_settings 
    ADD CONSTRAINT organization_settings_organization_id_fkey 
    FOREIGN KEY (organization_id)
    REFERENCES "meta_public".users (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
