-- Verify: schemas/meta_private/tables/api_tokens/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_private.api_tokens', 'insert', 'authenticated');
COMMIT;  

