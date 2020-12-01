-- Revert: schemas/meta_public/tables/apis/columns/dbname/column from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN dbname;
COMMIT;  

