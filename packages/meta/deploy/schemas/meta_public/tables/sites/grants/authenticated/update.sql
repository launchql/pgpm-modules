-- Deploy: schemas/meta_public/tables/sites/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".sites TO authenticated;
COMMIT;
