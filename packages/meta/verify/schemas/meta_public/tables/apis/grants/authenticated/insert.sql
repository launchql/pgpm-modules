-- Verify: schemas/meta_public/tables/apis/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.apis', 'insert', 'authenticated');
COMMIT;  

