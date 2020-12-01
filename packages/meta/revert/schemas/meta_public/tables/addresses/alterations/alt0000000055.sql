-- Revert: schemas/meta_public/tables/addresses/alterations/alt0000000055 from pg

BEGIN;
ALTER TABLE "meta_public".addresses DROP CONSTRAINT addresses_postcode_chk;
COMMIT;  

