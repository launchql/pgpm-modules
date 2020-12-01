-- Deploy: schemas/meta_public/tables/apps/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".apps TO authenticated;
COMMIT;
