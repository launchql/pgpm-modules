-- Verify: schemas/meta_public/tables/api_modules/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.api_modules', 'delete', 'authenticated');
COMMIT;  

