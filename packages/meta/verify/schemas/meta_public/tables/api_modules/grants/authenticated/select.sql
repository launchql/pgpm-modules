-- Verify: schemas/meta_public/tables/api_modules/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.api_modules', 'select', 'authenticated');
COMMIT;  

