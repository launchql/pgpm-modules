-- Verify: schemas/meta_public/tables/site_modules/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_modules', 'select', 'authenticated');
COMMIT;  

