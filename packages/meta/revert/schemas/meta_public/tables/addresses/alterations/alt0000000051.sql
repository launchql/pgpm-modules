-- Revert: schemas/meta_public/tables/addresses/alterations/alt0000000051 from pg

BEGIN;
ALTER TABLE "meta_public".addresses DROP CONSTRAINT addresses_address_line_3_chk;
COMMIT;  

