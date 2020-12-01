-- Deploy: schemas/meta_public/tables/sites/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table

BEGIN;

ALTER TABLE "meta_public".sites
    ENABLE ROW LEVEL SECURITY;
COMMIT;
