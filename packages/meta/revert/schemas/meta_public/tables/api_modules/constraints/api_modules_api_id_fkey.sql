-- Revert: schemas/meta_public/tables/api_modules/constraints/api_modules_api_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".api_modules 
    DROP CONSTRAINT api_modules_api_id_fkey;

COMMIT;  

