-- Verify: schemas/meta_public/tables/users/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.users', 'insert', 'authenticated');
COMMIT;  

