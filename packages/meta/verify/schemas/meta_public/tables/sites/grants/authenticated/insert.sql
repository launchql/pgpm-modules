-- Verify: schemas/meta_public/tables/sites/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.sites', 'insert', 'authenticated');
COMMIT;  

