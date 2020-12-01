-- Verify: schemas/meta_simple_secrets/tables/user_secrets/table on pg

BEGIN;
SELECT verify_table('meta_simple_secrets.user_secrets');
COMMIT;  

