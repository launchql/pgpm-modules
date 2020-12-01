-- Deploy: schemas/meta_public/tables/addresses/columns/county_province/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table

BEGIN;

ALTER TABLE "meta_public".addresses ADD COLUMN county_province text;
COMMIT;
