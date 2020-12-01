-- Verify: schemas/meta_public/tables/users/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.users', 'delete', 'authenticated');
COMMIT;  

