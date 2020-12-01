-- Verify: schemas/meta_public/tables/organization_settings/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.organization_settings', 'insert', 'authenticated');
COMMIT;  

