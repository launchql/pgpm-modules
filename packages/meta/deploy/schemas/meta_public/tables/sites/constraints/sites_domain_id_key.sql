-- Deploy: schemas/meta_public/tables/sites/constraints/sites_domain_id_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table

BEGIN;

ALTER TABLE "meta_public".sites
    ADD CONSTRAINT sites_domain_id_key UNIQUE (domain_id);
COMMIT;
