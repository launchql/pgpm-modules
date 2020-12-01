-- Revert: schemas/meta_public/tables/addresses/columns/city/column from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN city;
COMMIT;  

