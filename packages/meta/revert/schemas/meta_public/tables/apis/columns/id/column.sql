-- Revert: schemas/meta_public/tables/apis/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN id;
COMMIT;  

