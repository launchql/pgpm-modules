-- Revert: schemas/meta_public/tables/sites/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN owner_id;
COMMIT;  

