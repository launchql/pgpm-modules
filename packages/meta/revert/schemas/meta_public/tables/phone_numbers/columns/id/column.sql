-- Revert: schemas/meta_public/tables/phone_numbers/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers DROP COLUMN id;
COMMIT;  

