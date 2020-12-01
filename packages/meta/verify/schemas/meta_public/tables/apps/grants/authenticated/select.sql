-- Verify: schemas/meta_public/tables/apps/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.apps', 'select', 'authenticated');
COMMIT;  

