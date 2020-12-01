-- Verify: schemas/meta_public/tables/domains/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.domains', 'update', 'authenticated');
COMMIT;  

