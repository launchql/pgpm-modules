-- Deploy: schemas/meta_public/tables/apis/columns/role_name/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;

ALTER TABLE "meta_public".apis ADD COLUMN role_name text;
COMMIT;
