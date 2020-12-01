-- Verify: schemas/meta_public/tables/site_themes/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('meta_public.site_themes', 'insert', 'authenticated');
COMMIT;  

