-- Revert: schemas/meta_public/tables/phone_numbers/columns/owner_id/alterations/alt0000000064 from pg

BEGIN;


ALTER TABLE "meta_public".phone_numbers 
    ALTER COLUMN owner_id DROP NOT NULL;


COMMIT;  

