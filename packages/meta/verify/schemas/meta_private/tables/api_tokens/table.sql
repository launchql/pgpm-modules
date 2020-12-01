-- Verify: schemas/meta_private/tables/api_tokens/table on pg

BEGIN;
SELECT verify_table('meta_private.api_tokens');
COMMIT;  

