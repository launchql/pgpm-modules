-- Deploy: schemas/meta_public/tables/apis/columns/owner_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;

ALTER TABLE "meta_public".apis ADD COLUMN owner_id uuid;
COMMIT;
