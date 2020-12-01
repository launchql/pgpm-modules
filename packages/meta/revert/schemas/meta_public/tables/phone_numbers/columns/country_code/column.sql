-- Revert: schemas/meta_public/tables/phone_numbers/columns/country_code/column from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers DROP COLUMN country_code;
COMMIT;  

