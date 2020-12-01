-- Revert: schemas/meta_public/tables/apps/constraints/apps_owner_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".apps 
    DROP CONSTRAINT apps_owner_id_fkey;

COMMIT;  

