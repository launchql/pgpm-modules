-- Deploy: schemas/meta_public/tables/apis/policies/authenticated_can_select_on_apis to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table
-- requires: schemas/meta_public/tables/apis/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_apis ON "meta_public".apis FOR SELECT TO authenticated USING ( owner_id = "meta_public".get_current_user_id() OR owner_id = ANY( "meta_public".get_current_group_ids() ) );
COMMIT;
