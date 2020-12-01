-- Deploy: schemas/meta_public/tables/site_themes/policies/authenticated_can_update_on_site_themes to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_themes/table
-- requires: schemas/meta_public/tables/site_themes/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_update_on_site_themes ON "meta_public".site_themes FOR UPDATE TO authenticated USING ( (SELECT p.owner_id = ANY( "meta_public".get_current_group_ids() ) FROM "meta_public".sites AS p WHERE p.id = site_id) );
COMMIT;
