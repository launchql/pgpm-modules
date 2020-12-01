-- Deploy: schemas/meta_public/tables/apis/grants/authenticated/delete to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;
GRANT DELETE ON TABLE "meta_public".apis TO authenticated;
COMMIT;
