-- Revert: schemas/meta_public/tables/site_modules/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".site_modules
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

