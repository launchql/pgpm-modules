-- Verify: schemas/meta_public/tables/addresses/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.addresses', 'delete', 'authenticated');
COMMIT;  

