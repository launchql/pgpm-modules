-- Verify: schemas/meta_private/tables/api_tokens/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_private.api_tokens', 'update', 'authenticated');
COMMIT;  

