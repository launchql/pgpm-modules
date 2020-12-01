-- Verify: schemas/meta_public/tables/users/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.users', 'update', 'authenticated');
COMMIT;  

