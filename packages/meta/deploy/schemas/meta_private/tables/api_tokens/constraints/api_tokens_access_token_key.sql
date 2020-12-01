-- Deploy: schemas/meta_private/tables/api_tokens/constraints/api_tokens_access_token_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema
-- requires: schemas/meta_private/tables/api_tokens/table

BEGIN;

ALTER TABLE "meta_private".api_tokens
    ADD CONSTRAINT api_tokens_access_token_key UNIQUE (access_token);
COMMIT;
