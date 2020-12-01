-- Verify: schemas/meta_public/tables/addresses/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.addresses', 'update', 'authenticated');
COMMIT;  

