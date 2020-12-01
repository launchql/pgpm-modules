-- Revert: schemas/meta_public/tables/addresses/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "meta_public".addresses DROP COLUMN owner_id;
COMMIT;  

