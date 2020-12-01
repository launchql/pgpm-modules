-- Verify: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/table on pg

BEGIN;
SELECT verify_table('meta_encrypted_secrets.user_encrypted_secrets');
COMMIT;  

