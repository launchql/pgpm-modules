-- Deploy: schemas/meta_public/tables/emails/triggers/emails_insert_job_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_jobs/schema
-- requires: schemas/meta_public/schema

BEGIN;

CREATE TRIGGER emails_insert_job_tg AFTER
INSERT
    ON "meta_public".emails FOR EACH ROW
EXECUTE PROCEDURE "meta_jobs".tg_add_job_with_row ('new-user-email');
COMMIT;
