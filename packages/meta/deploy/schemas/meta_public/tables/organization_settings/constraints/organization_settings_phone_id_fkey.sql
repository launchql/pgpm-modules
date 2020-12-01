-- Deploy: schemas/meta_public/tables/organization_settings/constraints/organization_settings_phone_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table
-- requires: schemas/meta_public/tables/organization_settings/table
-- requires: schemas/meta_public/tables/phone_numbers/columns/id/column
-- requires: schemas/meta_public/tables/organization_settings/columns/phone_id/column

BEGIN;

ALTER TABLE "meta_public".organization_settings 
    ADD CONSTRAINT organization_settings_phone_id_fkey 
    FOREIGN KEY (phone_id)
    REFERENCES "meta_public".phone_numbers (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
