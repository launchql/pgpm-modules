-- Revert: schemas/meta_public/tables/users/columns/type/column from pg

BEGIN;


ALTER TABLE "meta_public".users DROP COLUMN type;
COMMIT;  

