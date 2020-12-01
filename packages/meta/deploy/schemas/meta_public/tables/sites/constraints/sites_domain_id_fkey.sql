-- Deploy: schemas/meta_public/tables/sites/constraints/sites_domain_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table
-- requires: schemas/meta_public/tables/domains/table
-- requires: schemas/meta_public/tables/domains/columns/id/column
-- requires: schemas/meta_public/tables/sites/columns/domain_id/column

BEGIN;

ALTER TABLE "meta_public".sites 
    ADD CONSTRAINT sites_domain_id_fkey 
    FOREIGN KEY (domain_id)
    REFERENCES "meta_public".domains (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
