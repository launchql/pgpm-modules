-- Deploy: schemas/meta_public/tables/site_modules/constraints/site_modules_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_modules/table

BEGIN;

ALTER TABLE "meta_public".site_modules
    ADD CONSTRAINT site_modules_pkey PRIMARY KEY (id);
COMMIT;
