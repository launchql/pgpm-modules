-- Verify: schemas/meta_public/tables/addresses/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.addresses', 'select', 'authenticated');
COMMIT;  

