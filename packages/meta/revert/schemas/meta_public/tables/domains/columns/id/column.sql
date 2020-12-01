-- Revert: schemas/meta_public/tables/domains/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".domains DROP COLUMN id;
COMMIT;  

