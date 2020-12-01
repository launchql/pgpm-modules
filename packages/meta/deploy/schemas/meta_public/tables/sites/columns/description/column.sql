-- Deploy: schemas/meta_public/tables/sites/columns/description/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table

BEGIN;

ALTER TABLE "meta_public".sites ADD COLUMN description text;
COMMIT;
