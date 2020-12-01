-- Verify: schemas/meta_public/tables/users/table on pg

BEGIN;
SELECT verify_table('meta_public.users');
COMMIT;  

