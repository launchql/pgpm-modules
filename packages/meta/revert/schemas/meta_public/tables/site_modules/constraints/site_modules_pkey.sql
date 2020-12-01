-- Revert: schemas/meta_public/tables/site_modules/constraints/site_modules_pkey from pg

BEGIN;


ALTER TABLE "meta_public".site_modules 
    DROP CONSTRAINT site_modules_pkey;

COMMIT;  

