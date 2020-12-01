-- Revert: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/user_id/alterations/alt0000000029 from pg

BEGIN;


ALTER TABLE "meta_encrypted_secrets".user_encrypted_secrets 
    ALTER COLUMN user_id DROP NOT NULL;


COMMIT;  

