-- Revert: schemas/meta_public/tables/domains/indexes/domains_owner_id_idx from pg

BEGIN;


DROP INDEX "meta_public".domains_owner_id_idx;

COMMIT;  

