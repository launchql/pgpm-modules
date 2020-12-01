-- Revert: schemas/meta_public/tables/domains/constraints/domains_owner_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".domains 
    DROP CONSTRAINT domains_owner_id_fkey;

COMMIT;  

