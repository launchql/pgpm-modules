-- Revert: schemas/meta_public/alterations/alt0000000058 from pg

BEGIN;
COMMENT ON CONSTRAINT addresses_owner_id_fkey ON "meta_public".addresses IS NULL;
COMMIT;  

