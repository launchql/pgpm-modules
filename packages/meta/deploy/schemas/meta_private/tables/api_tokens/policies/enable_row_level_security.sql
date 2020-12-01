-- Deploy: schemas/meta_private/tables/api_tokens/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema
-- requires: schemas/meta_private/tables/api_tokens/table

BEGIN;

ALTER TABLE "meta_private".api_tokens
    ENABLE ROW LEVEL SECURITY;
COMMIT;
