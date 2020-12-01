-- Revert: schemas/meta_public/tables/site_metadata/policies/authenticated_can_select_on_site_metadata from pg

BEGIN;
DROP POLICY authenticated_can_select_on_site_metadata ON "meta_public".site_metadata;
COMMIT;  

