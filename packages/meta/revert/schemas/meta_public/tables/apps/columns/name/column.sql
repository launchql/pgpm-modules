-- Revert: schemas/meta_public/tables/apps/columns/name/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN name;
COMMIT;  

