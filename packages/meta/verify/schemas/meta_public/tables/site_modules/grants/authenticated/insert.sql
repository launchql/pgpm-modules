-- Verify: schemas/meta_public/tables/site_modules/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_modules', 'insert', 'authenticated');
COMMIT;  

