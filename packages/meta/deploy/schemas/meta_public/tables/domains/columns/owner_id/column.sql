-- Deploy: schemas/meta_public/tables/domains/columns/owner_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;

ALTER TABLE "meta_public".domains ADD COLUMN owner_id uuid;
COMMIT;
