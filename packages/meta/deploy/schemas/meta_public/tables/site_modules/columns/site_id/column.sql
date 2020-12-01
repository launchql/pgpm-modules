-- Deploy: schemas/meta_public/tables/site_modules/columns/site_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_modules/table

BEGIN;

ALTER TABLE "meta_public".site_modules ADD COLUMN site_id uuid;
COMMIT;
