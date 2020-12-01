-- Verify: schemas/meta_public/tables/site_modules/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_modules', 'update', 'authenticated');
COMMIT;  

