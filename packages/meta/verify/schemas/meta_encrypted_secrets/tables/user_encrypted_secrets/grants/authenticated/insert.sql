-- Verify: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_encrypted_secrets.user_encrypted_secrets', 'insert', 'authenticated');
COMMIT;  

