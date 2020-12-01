-- Revert: schemas/meta_public/tables/sites/columns/logo/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN logo;
COMMIT;  

