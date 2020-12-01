-- Revert: schemas/meta_public/tables/addresses/columns/postcode/column from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN postcode;
COMMIT;  

