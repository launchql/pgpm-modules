-- Revert: schemas/meta_public/tables/api_modules/constraints/api_modules_pkey from pg

BEGIN;


ALTER TABLE "meta_public".api_modules 
    DROP CONSTRAINT api_modules_pkey;

COMMIT;  

