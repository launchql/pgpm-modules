-- Revert: schemas/meta_public/tables/apis/columns/schemas/column from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN schemas;
COMMIT;  

