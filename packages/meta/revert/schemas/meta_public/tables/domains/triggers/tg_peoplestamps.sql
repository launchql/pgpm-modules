-- Revert: schemas/meta_public/tables/domains/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".domains DROP COLUMN created_by;
ALTER TABLE "meta_public".domains DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".domains;


COMMIT;  

