-- Verify: schemas/meta_public/tables/apis/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.apis', 'update', 'authenticated');
COMMIT;  

