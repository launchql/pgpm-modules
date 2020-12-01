-- Revert: schemas/meta_simple_secrets/tables/user_secrets/columns/user_id/alterations/alt0000000014 from pg

BEGIN;


ALTER TABLE "meta_simple_secrets".user_secrets 
    ALTER COLUMN user_id DROP NOT NULL;


COMMIT;  

