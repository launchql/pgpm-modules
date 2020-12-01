-- Deploy: schemas/meta_public/tables/api_modules/constraints/api_modules_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/api_modules/table

BEGIN;

ALTER TABLE "meta_public".api_modules
    ADD CONSTRAINT api_modules_pkey PRIMARY KEY (id);
COMMIT;
