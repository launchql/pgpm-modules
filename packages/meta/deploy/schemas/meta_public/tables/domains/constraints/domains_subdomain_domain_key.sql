-- Deploy: schemas/meta_public/tables/domains/constraints/domains_subdomain_domain_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;

ALTER TABLE "meta_public".domains
    ADD CONSTRAINT domains_subdomain_domain_key UNIQUE (subdomain,domain);
COMMIT;
