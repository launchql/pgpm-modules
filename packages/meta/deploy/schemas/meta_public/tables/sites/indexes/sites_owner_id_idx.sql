-- Deploy: schemas/meta_public/tables/sites/indexes/sites_owner_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table

BEGIN;

CREATE INDEX sites_owner_id_idx ON "meta_public".sites (owner_id);
COMMIT;
