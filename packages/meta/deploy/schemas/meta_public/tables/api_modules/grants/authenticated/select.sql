-- Deploy: schemas/meta_public/tables/api_modules/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/api_modules/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".api_modules TO authenticated;
COMMIT;
