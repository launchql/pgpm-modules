-- Deploy: schemas/meta_public/tables/emails/constraints/emails_user_id_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/emails/table

BEGIN;

ALTER TABLE "meta_public".emails
    ADD CONSTRAINT emails_user_id_key UNIQUE (user_id);
COMMIT;
