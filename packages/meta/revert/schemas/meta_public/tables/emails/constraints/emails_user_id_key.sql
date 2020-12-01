-- Revert: schemas/meta_public/tables/emails/constraints/emails_user_id_key from pg

BEGIN;


ALTER TABLE "meta_public".emails 
    DROP CONSTRAINT emails_user_id_key;

COMMIT;  

