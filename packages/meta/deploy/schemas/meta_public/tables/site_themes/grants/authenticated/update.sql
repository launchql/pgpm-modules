-- Deploy: schemas/meta_public/tables/site_themes/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_themes/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".site_themes TO authenticated;
COMMIT;
