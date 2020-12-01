-- Verify: schemas/meta_public/tables/site_themes/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_themes', 'update', 'authenticated');
COMMIT;  

