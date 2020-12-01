-- Revert: schemas/meta_public/tables/emails/triggers/emails_insert_job_tg from pg

BEGIN;


DROP TRIGGER emails_insert_job_tg
    ON "meta_public".emails;
COMMIT;  

