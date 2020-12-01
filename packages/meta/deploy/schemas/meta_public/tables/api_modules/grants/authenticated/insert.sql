-- Deploy: schemas/meta_public/tables/api_modules/grants/authenticated/insert to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/api_modules/table

BEGIN;
GRANT INSERT ON TABLE "meta_public".api_modules TO authenticated;
COMMIT;
