-- Verify: schemas/meta_public/tables/emails/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.emails', 'select', 'authenticated');
COMMIT;  

