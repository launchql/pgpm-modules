-- Deploy: schemas/meta_public/tables/organization_settings/columns/address_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/organization_settings/table

BEGIN;

ALTER TABLE "meta_public".organization_settings ADD COLUMN address_id uuid;
COMMIT;
