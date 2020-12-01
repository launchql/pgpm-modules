-- Deploy: schemas/meta_public/tables/sites/policies/authenticated_can_update_on_sites to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table
-- requires: schemas/meta_public/tables/sites/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_update_on_sites ON "meta_public".sites FOR UPDATE TO authenticated USING ( owner_id = "meta_public".get_current_user_id() OR owner_id = ANY( "meta_public".get_current_group_ids() ) );
COMMIT;
