-- Revert: schemas/meta_public/tables/sites/columns/favicon/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN favicon;
COMMIT;  

