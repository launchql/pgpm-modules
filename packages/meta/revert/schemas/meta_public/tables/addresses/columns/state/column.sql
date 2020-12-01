-- Revert: schemas/meta_public/tables/addresses/columns/state/column from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN state;
COMMIT;  

