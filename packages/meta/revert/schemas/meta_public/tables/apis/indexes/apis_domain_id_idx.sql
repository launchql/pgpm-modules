-- Revert: schemas/meta_public/tables/apis/indexes/apis_domain_id_idx from pg

BEGIN;


DROP INDEX "meta_public".apis_domain_id_idx;

COMMIT;  

