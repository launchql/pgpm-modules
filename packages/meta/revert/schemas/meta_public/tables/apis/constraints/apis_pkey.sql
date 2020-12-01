-- Revert: schemas/meta_public/tables/apis/constraints/apis_pkey from pg

BEGIN;


ALTER TABLE "meta_public".apis 
    DROP CONSTRAINT apis_pkey;

COMMIT;  

