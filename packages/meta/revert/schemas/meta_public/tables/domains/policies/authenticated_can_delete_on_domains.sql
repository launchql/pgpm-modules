-- Revert: schemas/meta_public/tables/domains/policies/authenticated_can_delete_on_domains from pg

BEGIN;
DROP POLICY authenticated_can_delete_on_domains ON "meta_public".domains;
COMMIT;  

