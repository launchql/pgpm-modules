-- Deploy: schemas/meta_public/tables/apis/constraints/apis_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;

ALTER TABLE "meta_public".apis
    ADD CONSTRAINT apis_pkey PRIMARY KEY (id);
COMMIT;
