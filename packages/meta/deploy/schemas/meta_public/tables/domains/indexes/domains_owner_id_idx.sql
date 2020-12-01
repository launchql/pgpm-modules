-- Deploy: schemas/meta_public/tables/domains/indexes/domains_owner_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/domains/table

BEGIN;

CREATE INDEX domains_owner_id_idx ON "meta_public".domains (owner_id);
COMMIT;
