-- Deploy: schemas/meta_public/tables/domains/constraints/domains_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;

ALTER TABLE "meta_public".domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (id);
COMMIT;
