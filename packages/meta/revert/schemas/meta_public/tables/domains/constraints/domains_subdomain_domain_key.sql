-- Revert: schemas/meta_public/tables/domains/constraints/domains_subdomain_domain_key from pg

BEGIN;


ALTER TABLE "meta_public".domains 
    DROP CONSTRAINT domains_subdomain_domain_key;

COMMIT;  

