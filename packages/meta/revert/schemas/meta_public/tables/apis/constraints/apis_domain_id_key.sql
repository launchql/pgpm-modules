-- Revert: schemas/meta_public/tables/apis/constraints/apis_domain_id_key from pg

BEGIN;


ALTER TABLE "meta_public".apis 
    DROP CONSTRAINT apis_domain_id_key;

COMMIT;  

