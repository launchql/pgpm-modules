-- Verify: schemas/meta_simple_secrets/tables/user_secrets/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_simple_secrets.user_secrets', 'insert', 'authenticated');
COMMIT;  

