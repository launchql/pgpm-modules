-- Revert: schemas/meta_public/alterations/alt0000000142 from pg

BEGIN;
COMMENT ON CONSTRAINT apps_owner_id_fkey ON "meta_public".apps IS NULL;
COMMIT;  

