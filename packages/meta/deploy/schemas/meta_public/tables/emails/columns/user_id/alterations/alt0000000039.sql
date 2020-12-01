-- Deploy: schemas/meta_public/tables/emails/columns/user_id/alterations/alt0000000039 to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/emails/table
-- requires: schemas/meta_public/tables/emails/columns/user_id/column

BEGIN;

ALTER TABLE "meta_public".emails 
    ALTER COLUMN user_id SET NOT NULL;
COMMIT;
