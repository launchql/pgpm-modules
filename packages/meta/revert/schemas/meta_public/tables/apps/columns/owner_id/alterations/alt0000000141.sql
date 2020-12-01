-- Revert: schemas/meta_public/tables/apps/columns/owner_id/alterations/alt0000000141 from pg

BEGIN;


ALTER TABLE "meta_public".apps 
    ALTER COLUMN owner_id DROP NOT NULL;


COMMIT;  

