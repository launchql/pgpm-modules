-- Deploy: schemas/meta_public/tables/addresses/constraints/addresses_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table

BEGIN;

ALTER TABLE "meta_public".addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);
COMMIT;
