-- Revert: schemas/meta_public/tables/emails/constraints/emails_email_key from pg

BEGIN;


ALTER TABLE "meta_public".emails 
    DROP CONSTRAINT emails_email_key;

COMMIT;  

