-- Deploy: schemas/meta_public/tables/site_modules/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_modules/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".site_modules TO authenticated;
COMMIT;
