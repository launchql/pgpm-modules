-- Revert: schemas/meta_public/tables/phone_numbers/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers DROP COLUMN created_at;
ALTER TABLE "meta_public".phone_numbers DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".phone_numbers;

COMMIT;  

