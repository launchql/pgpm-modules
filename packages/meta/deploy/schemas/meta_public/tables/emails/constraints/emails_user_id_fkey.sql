-- Deploy: schemas/meta_public/tables/emails/constraints/emails_user_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table
-- requires: schemas/meta_public/tables/emails/table
-- requires: schemas/meta_public/tables/users/columns/id/column
-- requires: schemas/meta_public/tables/emails/columns/user_id/column

BEGIN;

ALTER TABLE "meta_public".emails 
    ADD CONSTRAINT emails_user_id_fkey 
    FOREIGN KEY (user_id)
    REFERENCES "meta_public".users (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
