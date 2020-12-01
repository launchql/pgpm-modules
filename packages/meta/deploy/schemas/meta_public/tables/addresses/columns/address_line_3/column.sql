-- Deploy: schemas/meta_public/tables/addresses/columns/address_line_3/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table

BEGIN;

ALTER TABLE "meta_public".addresses ADD COLUMN address_line_3 text;
COMMIT;
