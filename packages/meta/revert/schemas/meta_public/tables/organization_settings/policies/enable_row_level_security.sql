-- Revert: schemas/meta_public/tables/organization_settings/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

