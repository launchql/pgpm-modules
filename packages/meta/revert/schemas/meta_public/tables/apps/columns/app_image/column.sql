-- Revert: schemas/meta_public/tables/apps/columns/app_image/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN app_image;
COMMIT;  

