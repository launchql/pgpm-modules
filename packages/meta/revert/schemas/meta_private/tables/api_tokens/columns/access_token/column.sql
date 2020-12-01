-- Revert: schemas/meta_private/tables/api_tokens/columns/access_token/column from pg

BEGIN;


ALTER TABLE "meta_private".api_tokens DROP COLUMN access_token;
COMMIT;  

