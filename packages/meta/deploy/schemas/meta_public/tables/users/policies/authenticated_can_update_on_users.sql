-- Deploy: schemas/meta_public/tables/users/policies/authenticated_can_update_on_users to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table
-- requires: schemas/meta_public/tables/users/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_update_on_users ON "meta_public".users FOR UPDATE TO authenticated USING ( id = "meta_public".get_current_user_id() );
COMMIT;
