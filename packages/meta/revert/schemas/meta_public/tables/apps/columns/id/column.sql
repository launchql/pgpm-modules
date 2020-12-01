-- Revert: schemas/meta_public/tables/apps/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN id;
COMMIT;  

