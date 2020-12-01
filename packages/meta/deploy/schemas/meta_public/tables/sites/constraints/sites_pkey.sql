-- Deploy: schemas/meta_public/tables/sites/constraints/sites_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table

BEGIN;

ALTER TABLE "meta_public".sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);
COMMIT;
