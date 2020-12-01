-- Revert: schemas/meta_public/tables/sites/constraints/sites_owner_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".sites 
    DROP CONSTRAINT sites_owner_id_fkey;

COMMIT;  

