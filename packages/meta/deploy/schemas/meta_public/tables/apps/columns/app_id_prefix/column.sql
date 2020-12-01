-- Deploy: schemas/meta_public/tables/apps/columns/app_id_prefix/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;

ALTER TABLE "meta_public".apps ADD COLUMN app_id_prefix text;
COMMIT;
