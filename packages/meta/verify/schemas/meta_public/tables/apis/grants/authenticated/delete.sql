-- Verify: schemas/meta_public/tables/apis/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.apis', 'delete', 'authenticated');
COMMIT;  

