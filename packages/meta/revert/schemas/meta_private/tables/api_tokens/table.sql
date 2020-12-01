-- Revert: schemas/meta_private/tables/api_tokens/table from pg

BEGIN;
DROP TABLE "meta_private".api_tokens;
COMMIT;  

