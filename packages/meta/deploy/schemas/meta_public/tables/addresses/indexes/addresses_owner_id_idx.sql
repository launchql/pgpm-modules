-- Deploy: schemas/meta_public/tables/addresses/indexes/addresses_owner_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/addresses/table

BEGIN;

CREATE INDEX addresses_owner_id_idx ON "meta_public".addresses (owner_id);
COMMIT;
