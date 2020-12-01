-- Deploy: schemas/meta_public/tables/site_metadata/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_metadata/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".site_metadata TO authenticated;
COMMIT;
