-- Deploy: schemas/meta_public/tables/apps/grants/authenticated/insert to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;
GRANT INSERT ON TABLE "meta_public".apps TO authenticated;
COMMIT;
