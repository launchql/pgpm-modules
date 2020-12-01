-- Revert: schemas/meta_public/tables/addresses/columns/county_province/column from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN county_province;
COMMIT;  

