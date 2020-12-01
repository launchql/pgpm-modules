-- Revert: schemas/meta_public/tables/apps/constraints/apps_name_owner_id_key from pg

BEGIN;


ALTER TABLE "meta_public".apps 
    DROP CONSTRAINT apps_name_owner_id_key;

COMMIT;  

