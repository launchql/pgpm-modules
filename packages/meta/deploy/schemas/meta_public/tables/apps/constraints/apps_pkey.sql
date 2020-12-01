-- Deploy: schemas/meta_public/tables/apps/constraints/apps_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;

ALTER TABLE "meta_public".apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (id);
COMMIT;
