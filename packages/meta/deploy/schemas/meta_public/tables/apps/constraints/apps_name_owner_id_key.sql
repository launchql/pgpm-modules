-- Deploy: schemas/meta_public/tables/apps/constraints/apps_name_owner_id_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;

ALTER TABLE "meta_public".apps
    ADD CONSTRAINT apps_name_owner_id_key UNIQUE (name,owner_id);
COMMIT;
