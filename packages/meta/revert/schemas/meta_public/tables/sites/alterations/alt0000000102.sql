-- Revert: schemas/meta_public/tables/sites/alterations/alt0000000102 from pg

BEGIN;
ALTER TABLE "meta_public".sites DROP CONSTRAINT sites_title_chk;
COMMIT;  

