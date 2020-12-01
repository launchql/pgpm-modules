-- Revert: schemas/meta_public/tables/site_themes/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".site_themes
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

