-- Deploy: schemas/meta_public/tables/api_modules/constraints/api_modules_api_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table
-- requires: schemas/meta_public/tables/api_modules/table
-- requires: schemas/meta_public/tables/apis/columns/id/column
-- requires: schemas/meta_public/tables/api_modules/columns/api_id/column

BEGIN;

ALTER TABLE "meta_public".api_modules 
    ADD CONSTRAINT api_modules_api_id_fkey 
    FOREIGN KEY (api_id)
    REFERENCES "meta_public".apis (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
