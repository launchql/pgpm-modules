-- Verify: schemas/meta_public/tables/emails/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.emails', 'insert', 'authenticated');
COMMIT;  

