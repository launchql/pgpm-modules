-- Revert: schemas/meta_public/alterations/alt0000000124 from pg

BEGIN;
COMMENT ON CONSTRAINT site_modules_site_id_fkey ON "meta_public".site_modules IS NULL;
COMMIT;  

