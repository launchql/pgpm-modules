-- Revert: schemas/meta_public/tables/site_modules/indexes/site_modules_site_id_idx from pg

BEGIN;


DROP INDEX "meta_public".site_modules_site_id_idx;

COMMIT;  

