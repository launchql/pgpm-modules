-- Revert: schemas/meta_public/alterations/alt0000000043 from pg

BEGIN;
COMMENT ON CONSTRAINT emails_user_id_fkey ON "meta_public".emails IS NULL;
COMMIT;  

