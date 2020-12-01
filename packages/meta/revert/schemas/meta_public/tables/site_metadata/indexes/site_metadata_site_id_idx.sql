-- Revert: schemas/meta_public/tables/site_metadata/indexes/site_metadata_site_id_idx from pg

BEGIN;


DROP INDEX "meta_public".site_metadata_site_id_idx;

COMMIT;  

