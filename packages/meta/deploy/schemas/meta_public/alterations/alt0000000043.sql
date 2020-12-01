-- Deploy: schemas/meta_public/alterations/alt0000000043 to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema

BEGIN;
COMMENT ON CONSTRAINT emails_user_id_fkey ON "meta_public".emails IS NULL;
COMMIT;
