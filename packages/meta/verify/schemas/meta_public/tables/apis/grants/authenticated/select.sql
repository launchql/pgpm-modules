-- Verify: schemas/meta_public/tables/apis/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.apis', 'select', 'authenticated');
COMMIT;  

