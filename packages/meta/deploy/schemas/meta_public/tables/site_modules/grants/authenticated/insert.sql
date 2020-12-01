-- Deploy: schemas/meta_public/tables/site_modules/grants/authenticated/insert to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_modules/table

BEGIN;
GRANT INSERT ON TABLE "meta_public".site_modules TO authenticated;
COMMIT;
