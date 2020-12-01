-- Deploy: schemas/meta_public/tables/domains/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".domains TO authenticated;
COMMIT;
