-- Deploy: schemas/meta_public/tables/phone_numbers/constraints/phone_numbers_owner_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table
-- requires: schemas/meta_public/tables/phone_numbers/table
-- requires: schemas/meta_public/tables/users/columns/id/column
-- requires: schemas/meta_public/tables/phone_numbers/columns/owner_id/column

BEGIN;

ALTER TABLE "meta_public".phone_numbers 
    ADD CONSTRAINT phone_numbers_owner_id_fkey 
    FOREIGN KEY (owner_id)
    REFERENCES "meta_public".users (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
