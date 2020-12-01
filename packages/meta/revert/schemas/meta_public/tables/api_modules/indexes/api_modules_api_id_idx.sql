-- Revert: schemas/meta_public/tables/api_modules/indexes/api_modules_api_id_idx from pg

BEGIN;


DROP INDEX "meta_public".api_modules_api_id_idx;

COMMIT;  

