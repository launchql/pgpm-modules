-- Revert: schemas/meta_public/tables/domains/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "meta_public".domains DROP COLUMN owner_id;
COMMIT;  

