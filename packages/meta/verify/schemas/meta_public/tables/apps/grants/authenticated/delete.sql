-- Verify: schemas/meta_public/tables/apps/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.apps', 'delete', 'authenticated');
COMMIT;  

