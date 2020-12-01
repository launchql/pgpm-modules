-- Revert: schemas/meta_public/tables/users/policies/authenticated_can_update_on_users from pg

BEGIN;
DROP POLICY authenticated_can_update_on_users ON "meta_public".users;
COMMIT;  

