-- Revert: schemas/meta_public/tables/site_metadata/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".site_metadata
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

