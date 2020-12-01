-- Revert: schemas/meta_public/tables/sites/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN id;
COMMIT;  

