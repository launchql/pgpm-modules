-- Revert: schemas/meta_public/tables/apps/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN created_by;
ALTER TABLE "meta_public".apps DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".apps;


COMMIT;  

