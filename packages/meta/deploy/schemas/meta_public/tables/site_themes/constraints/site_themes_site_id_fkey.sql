-- Deploy: schemas/meta_public/tables/site_themes/constraints/site_themes_site_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table
-- requires: schemas/meta_public/tables/site_themes/table
-- requires: schemas/meta_public/tables/sites/columns/id/column
-- requires: schemas/meta_public/tables/site_themes/columns/site_id/column

BEGIN;

ALTER TABLE "meta_public".site_themes 
    ADD CONSTRAINT site_themes_site_id_fkey 
    FOREIGN KEY (site_id)
    REFERENCES "meta_public".sites (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
