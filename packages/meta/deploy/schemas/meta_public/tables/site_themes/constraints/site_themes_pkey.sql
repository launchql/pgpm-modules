-- Deploy: schemas/meta_public/tables/site_themes/constraints/site_themes_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_themes/table

BEGIN;

ALTER TABLE "meta_public".site_themes
    ADD CONSTRAINT site_themes_pkey PRIMARY KEY (id);
COMMIT;
