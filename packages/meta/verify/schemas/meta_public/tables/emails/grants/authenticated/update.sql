-- Verify: schemas/meta_public/tables/emails/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.emails', 'update', 'authenticated');
COMMIT;  

