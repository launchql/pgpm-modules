-- Revert: schemas/meta_public/tables/sites/constraints/sites_pkey from pg

BEGIN;


ALTER TABLE "meta_public".sites 
    DROP CONSTRAINT sites_pkey;

COMMIT;  

