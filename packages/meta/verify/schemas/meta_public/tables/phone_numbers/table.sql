-- Verify: schemas/meta_public/tables/phone_numbers/table on pg

BEGIN;
SELECT verify_table('meta_public.phone_numbers');
COMMIT;  

