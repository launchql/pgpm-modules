-- Verify: schemas/meta_public/tables/addresses/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.addresses', 'insert', 'authenticated');
COMMIT;  

