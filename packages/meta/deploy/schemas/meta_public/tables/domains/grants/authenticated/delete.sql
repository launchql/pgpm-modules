-- Deploy: schemas/meta_public/tables/domains/grants/authenticated/delete to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;
GRANT DELETE ON TABLE "meta_public".domains TO authenticated;
COMMIT;
