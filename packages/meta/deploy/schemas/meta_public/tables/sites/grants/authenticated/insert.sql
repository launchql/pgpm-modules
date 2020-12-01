-- Deploy: schemas/meta_public/tables/sites/grants/authenticated/insert to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table

BEGIN;
GRANT INSERT ON TABLE "meta_public".sites TO authenticated;
COMMIT;
