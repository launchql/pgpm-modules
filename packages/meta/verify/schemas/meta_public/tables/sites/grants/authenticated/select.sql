-- Verify: schemas/meta_public/tables/sites/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.sites', 'select', 'authenticated');
COMMIT;  

