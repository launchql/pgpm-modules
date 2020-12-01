-- Deploy: schemas/meta_public/tables/site_metadata/indexes/site_metadata_site_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_metadata/table

BEGIN;

CREATE INDEX site_metadata_site_id_idx ON "meta_public".site_metadata (site_id);
COMMIT;
