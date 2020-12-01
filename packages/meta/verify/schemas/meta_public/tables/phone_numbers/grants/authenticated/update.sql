-- Verify: schemas/meta_public/tables/phone_numbers/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.phone_numbers', 'update', 'authenticated');
COMMIT;  

