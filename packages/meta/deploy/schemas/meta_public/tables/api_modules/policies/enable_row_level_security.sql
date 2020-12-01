-- Deploy: schemas/meta_public/tables/api_modules/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/api_modules/table

BEGIN;

ALTER TABLE "meta_public".api_modules
    ENABLE ROW LEVEL SECURITY;
COMMIT;
