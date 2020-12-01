-- Deploy: schemas/meta_public/tables/users/constraints/users_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table

BEGIN;

ALTER TABLE "meta_public".users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
COMMIT;
