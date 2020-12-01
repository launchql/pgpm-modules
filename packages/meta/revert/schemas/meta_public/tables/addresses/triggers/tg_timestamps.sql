-- Revert: schemas/meta_public/tables/addresses/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN created_at;
ALTER TABLE "meta_public".addresses DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".addresses;

COMMIT;  

