-- Deploy: schemas/meta_public/tables/site_metadata/policies/authenticated_can_insert_on_site_metadata to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_metadata/table
-- requires: schemas/meta_public/tables/site_metadata/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_insert_on_site_metadata ON "meta_public".site_metadata FOR INSERT TO authenticated WITH CHECK ( (SELECT p.owner_id = ANY( "meta_public".get_current_group_ids() ) FROM "meta_public".sites AS p WHERE p.id = site_id) );
COMMIT;
