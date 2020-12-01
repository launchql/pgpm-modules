-- Revert: schemas/meta_public/tables/apis/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN created_by;
ALTER TABLE "meta_public".apis DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".apis;


COMMIT;  

