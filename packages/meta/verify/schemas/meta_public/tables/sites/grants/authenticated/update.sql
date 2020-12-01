-- Verify: schemas/meta_public/tables/sites/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.sites', 'update', 'authenticated');
COMMIT;  

