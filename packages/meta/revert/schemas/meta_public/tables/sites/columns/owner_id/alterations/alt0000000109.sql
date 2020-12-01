-- Revert: schemas/meta_public/tables/sites/columns/owner_id/alterations/alt0000000109 from pg

BEGIN;


ALTER TABLE "meta_public".sites 
    ALTER COLUMN owner_id DROP NOT NULL;


COMMIT;  

