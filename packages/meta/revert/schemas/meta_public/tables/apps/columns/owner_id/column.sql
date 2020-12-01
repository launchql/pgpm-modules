-- Revert: schemas/meta_public/tables/apps/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN owner_id;
COMMIT;  

