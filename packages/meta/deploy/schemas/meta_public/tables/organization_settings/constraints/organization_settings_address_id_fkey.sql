-- Deploy: schemas/meta_public/tables/organization_settings/constraints/organization_settings_address_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table
-- requires: schemas/meta_public/tables/addresses/columns/id/column
-- requires: schemas/meta_public/tables/organization_settings/table
-- requires: schemas/meta_public/tables/organization_settings/columns/address_id/column

BEGIN;

ALTER TABLE "meta_public".organization_settings 
    ADD CONSTRAINT organization_settings_address_id_fkey 
    FOREIGN KEY (address_id)
    REFERENCES "meta_public".addresses (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
