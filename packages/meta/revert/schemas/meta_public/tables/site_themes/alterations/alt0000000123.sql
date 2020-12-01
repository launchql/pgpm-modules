-- Revert: schemas/meta_public/tables/site_themes/alterations/alt0000000123 from pg

BEGIN;


ALTER TABLE "meta_public".site_themes
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

