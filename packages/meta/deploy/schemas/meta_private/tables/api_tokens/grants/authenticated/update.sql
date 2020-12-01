-- Deploy: schemas/meta_private/tables/api_tokens/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema
-- requires: schemas/meta_private/tables/api_tokens/table

BEGIN;
GRANT UPDATE ON TABLE "meta_private".api_tokens TO authenticated;
COMMIT;
