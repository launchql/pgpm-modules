-- Deploy: schemas/meta_public/tables/site_themes/columns/id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_themes/table

BEGIN;

ALTER TABLE "meta_public".site_themes ADD COLUMN id uuid;
COMMIT;
