-- Revert: schemas/meta_public/tables/addresses/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN id;
COMMIT;  

