-- Deploy: schemas/meta_public/tables/organization_settings/policies/authenticated_can_update_on_organization_settings to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/organization_settings/table
-- requires: schemas/meta_public/tables/organization_settings/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_update_on_organization_settings ON "meta_public".organization_settings FOR UPDATE TO authenticated USING ( organization_id = "meta_public".get_current_user_id() OR organization_id = ANY( "meta_public".get_current_group_ids() ) );
COMMIT;
