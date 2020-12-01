-- Deploy: schemas/meta_public/tables/emails/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/emails/table

BEGIN;

ALTER TABLE "meta_public".emails
    ENABLE ROW LEVEL SECURITY;
COMMIT;
