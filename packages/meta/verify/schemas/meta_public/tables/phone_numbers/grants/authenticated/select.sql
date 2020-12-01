-- Verify: schemas/meta_public/tables/phone_numbers/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.phone_numbers', 'select', 'authenticated');
COMMIT;  

