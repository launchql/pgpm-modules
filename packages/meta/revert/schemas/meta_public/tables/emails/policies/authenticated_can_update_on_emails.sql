-- Revert: schemas/meta_public/tables/emails/policies/authenticated_can_update_on_emails from pg

BEGIN;
DROP POLICY authenticated_can_update_on_emails ON "meta_public".emails;
COMMIT;  

