-- Revert: schemas/meta_public/tables/apis/columns/domain_id/column from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN domain_id;
COMMIT;  

