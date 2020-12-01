-- Verify: schemas/meta_public/tables/emails/table on pg

BEGIN;
SELECT verify_table('meta_public.emails');
COMMIT;  

