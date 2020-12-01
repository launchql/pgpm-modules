-- Revert: schemas/meta_public/tables/site_themes/indexes/site_themes_site_id_idx from pg

BEGIN;


DROP INDEX "meta_public".site_themes_site_id_idx;

COMMIT;  

