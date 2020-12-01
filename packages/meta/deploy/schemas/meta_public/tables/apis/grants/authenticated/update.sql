-- Deploy: schemas/meta_public/tables/apis/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".apis TO authenticated;
COMMIT;
