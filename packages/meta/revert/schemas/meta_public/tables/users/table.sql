-- Revert: schemas/meta_public/tables/users/table from pg

BEGIN;
DROP TABLE "meta_public".users;
COMMIT;  

