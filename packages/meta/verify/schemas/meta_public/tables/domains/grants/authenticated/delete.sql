-- Verify: schemas/meta_public/tables/domains/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.domains', 'delete', 'authenticated');
COMMIT;  

