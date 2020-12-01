-- Deploy: schemas/meta_public/tables/phone_numbers/constraints/phone_numbers_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table

BEGIN;

ALTER TABLE "meta_public".phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);
COMMIT;
