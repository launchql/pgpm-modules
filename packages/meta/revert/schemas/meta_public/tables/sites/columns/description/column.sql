-- Revert: schemas/meta_public/tables/sites/columns/description/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN description;
COMMIT;  

