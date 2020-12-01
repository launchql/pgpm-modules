-- Verify: schemas/meta_public/tables/users/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.users', 'select', 'authenticated');
COMMIT;  

