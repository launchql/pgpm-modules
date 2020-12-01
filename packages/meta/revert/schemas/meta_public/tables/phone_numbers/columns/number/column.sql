-- Revert: schemas/meta_public/tables/phone_numbers/columns/number/column from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers DROP COLUMN number;
COMMIT;  

