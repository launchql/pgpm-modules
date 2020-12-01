-- Verify: schemas/meta_public/tables/organization_settings/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.organization_settings', 'update', 'authenticated');
COMMIT;  

