-- Verify: schemas/meta_public/tables/phone_numbers/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.phone_numbers', 'insert', 'authenticated');
COMMIT;  

