-- Revert: schemas/meta_public/tables/addresses/constraints/addresses_pkey from pg

BEGIN;


ALTER TABLE "meta_public".addresses 
    DROP CONSTRAINT addresses_pkey;

COMMIT;  

