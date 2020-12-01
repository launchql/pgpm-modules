-- Revert: schemas/meta_public/tables/phone_numbers/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers DROP COLUMN owner_id;
COMMIT;  

