-- Deploy: schemas/meta_public/tables/emails/columns/is_verified/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/emails/table

BEGIN;

ALTER TABLE "meta_public".emails ADD COLUMN is_verified boolean;
COMMIT;
