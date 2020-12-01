-- Deploy: schemas/meta_public/tables/addresses/grants/authenticated/delete to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table

BEGIN;
GRANT DELETE ON TABLE "meta_public".addresses TO authenticated;
COMMIT;
