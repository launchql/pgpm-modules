-- Revert: schemas/meta_public/tables/apis/indexes/apis_owner_id_idx from pg

BEGIN;


DROP INDEX "meta_public".apis_owner_id_idx;

COMMIT;  

