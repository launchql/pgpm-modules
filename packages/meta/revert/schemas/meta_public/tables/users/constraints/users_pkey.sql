-- Revert: schemas/meta_public/tables/users/constraints/users_pkey from pg

BEGIN;


ALTER TABLE "meta_public".users 
    DROP CONSTRAINT users_pkey;

COMMIT;  

