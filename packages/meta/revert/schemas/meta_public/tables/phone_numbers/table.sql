-- Revert: schemas/meta_public/tables/phone_numbers/table from pg

BEGIN;
DROP TABLE "meta_public".phone_numbers;
COMMIT;  

