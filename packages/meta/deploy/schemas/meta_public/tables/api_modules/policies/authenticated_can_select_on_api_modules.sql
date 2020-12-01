-- Deploy: schemas/meta_public/tables/api_modules/policies/authenticated_can_select_on_api_modules to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/api_modules/table
-- requires: schemas/meta_public/tables/api_modules/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_api_modules ON "meta_public".api_modules FOR SELECT TO authenticated USING ( (SELECT p.owner_id = ANY( "meta_public".get_current_group_ids() ) FROM "meta_public".apis AS p WHERE p.id = api_id) );
COMMIT;
