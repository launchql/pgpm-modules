-- Revert: schemas/meta_public/tables/apis/policies/authenticated_can_select_on_apis from pg

BEGIN;
DROP POLICY authenticated_can_select_on_apis ON "meta_public".apis;
COMMIT;  

