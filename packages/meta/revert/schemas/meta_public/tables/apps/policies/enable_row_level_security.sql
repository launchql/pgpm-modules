-- Revert: schemas/meta_public/tables/apps/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".apps
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

