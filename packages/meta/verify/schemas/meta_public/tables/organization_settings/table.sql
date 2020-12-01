-- Verify: schemas/meta_public/tables/organization_settings/table on pg

BEGIN;
SELECT verify_table('meta_public.organization_settings');
COMMIT;  

