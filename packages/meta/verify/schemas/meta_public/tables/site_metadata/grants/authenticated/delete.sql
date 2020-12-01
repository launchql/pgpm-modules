-- Verify: schemas/meta_public/tables/site_metadata/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_metadata', 'delete', 'authenticated');
COMMIT;  

