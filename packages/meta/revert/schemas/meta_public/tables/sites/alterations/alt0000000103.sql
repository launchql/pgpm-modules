-- Revert: schemas/meta_public/tables/sites/alterations/alt0000000103 from pg

BEGIN;
ALTER TABLE "meta_public".sites DROP CONSTRAINT sites_description_chk;
COMMIT;  

