-- Deploy: schemas/meta_public/tables/apis/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".apis TO authenticated;
COMMIT;
