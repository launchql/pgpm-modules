-- Revert: schemas/meta_public/tables/sites/columns/title/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN title;
COMMIT;  

