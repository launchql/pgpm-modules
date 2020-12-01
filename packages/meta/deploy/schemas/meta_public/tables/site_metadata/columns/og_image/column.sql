-- Deploy: schemas/meta_public/tables/site_metadata/columns/og_image/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_metadata/table

BEGIN;

ALTER TABLE "meta_public".site_metadata ADD COLUMN og_image image;
COMMIT;
