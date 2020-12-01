-- Revert: schemas/meta_public/tables/sites/columns/domain_id/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN domain_id;
COMMIT;  

