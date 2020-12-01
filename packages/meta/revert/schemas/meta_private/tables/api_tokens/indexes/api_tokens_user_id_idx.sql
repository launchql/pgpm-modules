-- Revert: schemas/meta_private/tables/api_tokens/indexes/api_tokens_user_id_idx from pg

BEGIN;


DROP INDEX "meta_private".api_tokens_user_id_idx;

COMMIT;  

