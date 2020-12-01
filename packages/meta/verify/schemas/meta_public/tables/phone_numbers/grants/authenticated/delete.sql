-- Verify: schemas/meta_public/tables/phone_numbers/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.phone_numbers', 'delete', 'authenticated');
COMMIT;  

