-- Verify: schemas/meta_public/tables/domains/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.domains', 'select', 'authenticated');
COMMIT;  

