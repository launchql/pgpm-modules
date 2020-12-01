-- Revert: schemas/meta_public/tables/api_modules/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".api_modules
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

