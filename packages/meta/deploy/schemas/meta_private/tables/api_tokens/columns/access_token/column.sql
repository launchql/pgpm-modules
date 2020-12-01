-- Deploy: schemas/meta_private/tables/api_tokens/columns/access_token/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema
-- requires: schemas/meta_private/tables/api_tokens/table

BEGIN;

ALTER TABLE "meta_private".api_tokens ADD COLUMN access_token text;
COMMIT;
