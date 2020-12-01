-- Deploy: schemas/meta_public/tables/users/columns/id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table

BEGIN;

ALTER TABLE "meta_public".users ADD COLUMN id uuid;
COMMIT;
