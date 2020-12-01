-- Verify: schemas/meta_public/tables/sites/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.sites', 'delete', 'authenticated');
COMMIT;  

