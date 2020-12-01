-- Deploy: schemas/meta_public/tables/domains/columns/id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;

ALTER TABLE "meta_public".domains ADD COLUMN id uuid;
COMMIT;
