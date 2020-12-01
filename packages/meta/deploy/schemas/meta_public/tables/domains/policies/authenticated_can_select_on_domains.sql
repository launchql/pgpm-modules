-- Deploy: schemas/meta_public/tables/domains/policies/authenticated_can_select_on_domains to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table
-- requires: schemas/meta_public/tables/domains/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_domains ON "meta_public".domains FOR SELECT TO authenticated USING ( owner_id = "meta_public".get_current_user_id() OR owner_id = ANY( "meta_public".get_current_group_ids() ) );
COMMIT;
