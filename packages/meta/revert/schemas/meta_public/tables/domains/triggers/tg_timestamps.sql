-- Revert: schemas/meta_public/tables/domains/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".domains DROP COLUMN created_at;
ALTER TABLE "meta_public".domains DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".domains;

COMMIT;  

