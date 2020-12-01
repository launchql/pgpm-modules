-- Revert: schemas/meta_public/tables/site_metadata/constraints/site_metadata_site_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".site_metadata 
    DROP CONSTRAINT site_metadata_site_id_fkey;

COMMIT;  

