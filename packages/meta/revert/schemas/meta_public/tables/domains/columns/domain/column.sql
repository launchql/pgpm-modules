-- Revert: schemas/meta_public/tables/domains/columns/domain/column from pg

BEGIN;


ALTER TABLE "meta_public".domains DROP COLUMN domain;
COMMIT;  

