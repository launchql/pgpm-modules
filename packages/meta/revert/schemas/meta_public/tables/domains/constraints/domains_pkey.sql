-- Revert: schemas/meta_public/tables/domains/constraints/domains_pkey from pg

BEGIN;


ALTER TABLE "meta_public".domains 
    DROP CONSTRAINT domains_pkey;

COMMIT;  

