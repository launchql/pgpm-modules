-- Revert: schemas/meta_public/tables/apps/columns/app_id_prefix/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN app_id_prefix;
COMMIT;  

