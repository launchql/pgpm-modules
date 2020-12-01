-- Verify: schemas/meta_public/tables/emails/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('meta_public.emails', 'delete', 'authenticated');
COMMIT;  

