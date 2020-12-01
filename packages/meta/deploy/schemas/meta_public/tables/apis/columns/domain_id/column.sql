-- Deploy: schemas/meta_public/tables/apis/columns/domain_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;

ALTER TABLE "meta_public".apis ADD COLUMN domain_id uuid;
COMMIT;
