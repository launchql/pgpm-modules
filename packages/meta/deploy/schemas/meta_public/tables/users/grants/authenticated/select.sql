-- Deploy: schemas/meta_public/tables/users/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".users TO authenticated;
COMMIT;
