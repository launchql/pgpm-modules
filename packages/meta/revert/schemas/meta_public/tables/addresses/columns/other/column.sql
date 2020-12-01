-- Revert: schemas/meta_public/tables/addresses/columns/other/column from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN other;
COMMIT;  

