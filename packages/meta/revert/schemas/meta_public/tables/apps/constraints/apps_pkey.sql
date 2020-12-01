-- Revert: schemas/meta_public/tables/apps/constraints/apps_pkey from pg

BEGIN;


ALTER TABLE "meta_public".apps 
    DROP CONSTRAINT apps_pkey;

COMMIT;  

