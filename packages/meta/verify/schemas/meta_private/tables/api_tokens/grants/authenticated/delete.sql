-- Verify: schemas/meta_private/tables/api_tokens/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_private.api_tokens', 'delete', 'authenticated');
COMMIT;  

