-- Deploy: schemas/meta_private/tables/api_tokens/policies/authenticated_can_select_on_api_tokens to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema
-- requires: schemas/meta_private/tables/api_tokens/table
-- requires: schemas/meta_private/tables/api_tokens/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_api_tokens ON "meta_private".api_tokens FOR SELECT TO authenticated USING ( user_id = "meta_public".get_current_user_id() );
COMMIT;
