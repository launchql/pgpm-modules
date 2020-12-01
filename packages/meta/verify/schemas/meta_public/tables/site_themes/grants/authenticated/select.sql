-- Verify: schemas/meta_public/tables/site_themes/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_themes', 'select', 'authenticated');
COMMIT;  

