-- Verify: schemas/meta_public/tables/domains/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.domains', 'insert', 'authenticated');
COMMIT;  

