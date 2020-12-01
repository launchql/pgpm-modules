-- Verify: schemas/meta_public/tables/organization_settings/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.organization_settings', 'delete', 'authenticated');
COMMIT;  

