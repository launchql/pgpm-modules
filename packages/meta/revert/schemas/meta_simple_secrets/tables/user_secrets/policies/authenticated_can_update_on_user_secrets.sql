-- Revert: schemas/meta_simple_secrets/tables/user_secrets/policies/authenticated_can_update_on_user_secrets from pg

BEGIN;
DROP POLICY authenticated_can_update_on_user_secrets ON "meta_simple_secrets".user_secrets;
COMMIT;  

