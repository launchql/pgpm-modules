-- Deploy: schemas/meta_public/tables/apps/columns/id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;

ALTER TABLE "meta_public".apps ADD COLUMN id uuid;
COMMIT;
