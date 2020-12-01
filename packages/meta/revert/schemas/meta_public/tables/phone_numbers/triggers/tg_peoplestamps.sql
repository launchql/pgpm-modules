-- Revert: schemas/meta_public/tables/phone_numbers/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers DROP COLUMN created_by;
ALTER TABLE "meta_public".phone_numbers DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".phone_numbers;


COMMIT;  

