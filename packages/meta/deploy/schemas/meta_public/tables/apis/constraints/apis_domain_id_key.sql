-- Deploy: schemas/meta_public/tables/apis/constraints/apis_domain_id_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;

ALTER TABLE "meta_public".apis
    ADD CONSTRAINT apis_domain_id_key UNIQUE (domain_id);
COMMIT;
