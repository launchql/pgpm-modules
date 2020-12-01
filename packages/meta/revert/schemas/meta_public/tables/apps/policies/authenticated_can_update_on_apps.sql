-- Revert: schemas/meta_public/tables/apps/policies/authenticated_can_update_on_apps from pg

BEGIN;
DROP POLICY authenticated_can_update_on_apps ON "meta_public".apps;
COMMIT;  

