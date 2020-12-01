-- Revert: schemas/meta_public/tables/apis/constraints/apis_domain_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".apis 
    DROP CONSTRAINT apis_domain_id_fkey;

COMMIT;  

