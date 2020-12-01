-- Revert: schemas/meta_public/tables/sites/constraints/sites_domain_id_key from pg

BEGIN;


ALTER TABLE "meta_public".sites 
    DROP CONSTRAINT sites_domain_id_key;

COMMIT;  

