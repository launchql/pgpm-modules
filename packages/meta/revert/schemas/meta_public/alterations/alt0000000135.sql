-- Revert: schemas/meta_public/alterations/alt0000000135 from pg

BEGIN;
COMMENT ON CONSTRAINT site_metadata_site_id_fkey ON "meta_public".site_metadata IS NULL;
COMMIT;  

