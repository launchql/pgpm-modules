-- Deploy: schemas/meta_public/tables/addresses/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".addresses TO authenticated;
COMMIT;
