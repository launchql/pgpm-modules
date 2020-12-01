-- Revert: schemas/meta_public/tables/sites/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN created_by;
ALTER TABLE "meta_public".sites DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".sites;


COMMIT;  

