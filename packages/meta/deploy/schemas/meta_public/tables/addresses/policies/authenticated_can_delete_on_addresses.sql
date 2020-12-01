-- Deploy: schemas/meta_public/tables/addresses/policies/authenticated_can_delete_on_addresses to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table
-- requires: schemas/meta_public/tables/addresses/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_delete_on_addresses ON "meta_public".addresses FOR DELETE TO authenticated USING ( owner_id = "meta_public".get_current_user_id() OR owner_id = ANY( "meta_public".get_current_group_ids() ) );
COMMIT;
