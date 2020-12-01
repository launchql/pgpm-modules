-- Revert: schemas/meta_public/tables/addresses/indexes/addresses_owner_id_idx from pg

BEGIN;


DROP INDEX "meta_public".addresses_owner_id_idx;

COMMIT;  

