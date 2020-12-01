-- Verify: schemas/meta_public/tables/api_modules/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.api_modules', 'update', 'authenticated');
COMMIT;  

