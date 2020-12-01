-- Deploy: schemas/meta_public/tables/site_themes/indexes/site_themes_site_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_themes/table

BEGIN;

CREATE INDEX site_themes_site_id_idx ON "meta_public".site_themes (site_id);
COMMIT;
