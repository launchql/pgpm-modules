-- Deploy: schemas/meta_private/tables/api_tokens/indexes/api_tokens_user_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema
-- requires: schemas/meta_private/tables/api_tokens/table

BEGIN;

CREATE INDEX api_tokens_user_id_idx ON "meta_private".api_tokens (user_id);
COMMIT;
