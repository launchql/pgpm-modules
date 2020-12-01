-- Deploy: schemas/meta_public/tables/emails/indexes/emails_user_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/emails/table

BEGIN;

CREATE INDEX emails_user_id_idx ON "meta_public".emails (user_id);
COMMIT;
