-- Revert: schemas/meta_public/tables/sites/indexes/sites_owner_id_idx from pg

BEGIN;


DROP INDEX "meta_public".sites_owner_id_idx;

COMMIT;  

