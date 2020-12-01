-- Revert: schemas/meta_public/tables/apps/columns/play_store_link/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN play_store_link;
COMMIT;  

