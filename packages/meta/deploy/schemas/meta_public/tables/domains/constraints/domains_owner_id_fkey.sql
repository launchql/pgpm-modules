-- Deploy: schemas/meta_public/tables/domains/constraints/domains_owner_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table
-- requires: schemas/meta_public/tables/domains/table
-- requires: schemas/meta_public/tables/users/columns/id/column
-- requires: schemas/meta_public/tables/domains/columns/owner_id/column

BEGIN;

ALTER TABLE "meta_public".domains 
    ADD CONSTRAINT domains_owner_id_fkey 
    FOREIGN KEY (owner_id)
    REFERENCES "meta_public".users (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
