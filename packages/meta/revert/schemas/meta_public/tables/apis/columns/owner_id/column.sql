-- Revert: schemas/meta_public/tables/apis/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN owner_id;
COMMIT;  

