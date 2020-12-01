-- Revert: schemas/meta_public/tables/site_themes/columns/theme/column from pg

BEGIN;


ALTER TABLE "meta_public".site_themes DROP COLUMN theme;
COMMIT;  

