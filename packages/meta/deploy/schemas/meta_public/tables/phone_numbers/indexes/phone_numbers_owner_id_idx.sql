-- Deploy: schemas/meta_public/tables/phone_numbers/indexes/phone_numbers_owner_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table

BEGIN;

CREATE INDEX phone_numbers_owner_id_idx ON "meta_public".phone_numbers (owner_id);
COMMIT;
