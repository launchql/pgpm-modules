-- Revert: schemas/meta_public/tables/apis/constraints/apis_owner_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".apis 
    DROP CONSTRAINT apis_owner_id_fkey;

COMMIT;  

