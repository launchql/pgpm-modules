-- Revert: schemas/meta_public/tables/site_themes/policies/authenticated_can_update_on_site_themes from pg

BEGIN;
DROP POLICY authenticated_can_update_on_site_themes ON "meta_public".site_themes;
COMMIT;  

