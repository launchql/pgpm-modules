-- Verify: schemas/meta_public/tables/site_metadata/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_metadata', 'update', 'authenticated');
COMMIT;  

