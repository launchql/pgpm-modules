-- Revert: schemas/meta_private/tables/api_tokens/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_private".api_tokens DROP COLUMN id;
COMMIT;  

