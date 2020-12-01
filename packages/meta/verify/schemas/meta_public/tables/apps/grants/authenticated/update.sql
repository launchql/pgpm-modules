-- Verify: schemas/meta_public/tables/apps/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.apps', 'update', 'authenticated');
COMMIT;  

