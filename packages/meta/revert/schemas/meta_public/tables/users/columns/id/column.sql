-- Revert: schemas/meta_public/tables/users/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".users DROP COLUMN id;
COMMIT;  

