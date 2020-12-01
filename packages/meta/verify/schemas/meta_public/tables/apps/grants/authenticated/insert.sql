-- Verify: schemas/meta_public/tables/apps/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.apps', 'insert', 'authenticated');
COMMIT;  

