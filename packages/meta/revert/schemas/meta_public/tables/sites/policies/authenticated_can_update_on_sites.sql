-- Revert: schemas/meta_public/tables/sites/policies/authenticated_can_update_on_sites from pg

BEGIN;
DROP POLICY authenticated_can_update_on_sites ON "meta_public".sites;
COMMIT;  

