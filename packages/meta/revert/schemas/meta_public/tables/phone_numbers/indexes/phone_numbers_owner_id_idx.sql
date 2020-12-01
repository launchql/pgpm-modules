-- Revert: schemas/meta_public/tables/phone_numbers/indexes/phone_numbers_owner_id_idx from pg

BEGIN;


DROP INDEX "meta_public".phone_numbers_owner_id_idx;

COMMIT;  

