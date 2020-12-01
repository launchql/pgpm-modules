-- Verify: schemas/meta_public/tables/addresses/table on pg

BEGIN;
SELECT verify_table('meta_public.addresses');
COMMIT;  

