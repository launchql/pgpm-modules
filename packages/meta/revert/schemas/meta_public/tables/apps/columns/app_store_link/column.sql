-- Revert: schemas/meta_public/tables/apps/columns/app_store_link/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN app_store_link;
COMMIT;  

