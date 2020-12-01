-- Deploy: schemas/meta_public/tables/site_modules/indexes/site_modules_site_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_modules/table

BEGIN;

CREATE INDEX site_modules_site_id_idx ON "meta_public".site_modules (site_id);
COMMIT;
