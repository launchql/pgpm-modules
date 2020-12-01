-- Deploy: schemas/meta_public/tables/domains/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;

ALTER TABLE "meta_public".domains
    ENABLE ROW LEVEL SECURITY;
COMMIT;
