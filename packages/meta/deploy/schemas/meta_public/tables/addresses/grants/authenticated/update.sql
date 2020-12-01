-- Deploy: schemas/meta_public/tables/addresses/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".addresses TO authenticated;
COMMIT;
