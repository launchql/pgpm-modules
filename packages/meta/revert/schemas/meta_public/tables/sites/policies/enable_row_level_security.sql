-- Revert: schemas/meta_public/tables/sites/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".sites
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

