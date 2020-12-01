-- Revert: schemas/meta_public/tables/addresses/columns/owner_id/alterations/alt0000000057 from pg

BEGIN;


ALTER TABLE "meta_public".addresses 
    ALTER COLUMN owner_id DROP NOT NULL;


COMMIT;  

