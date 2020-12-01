-- Deploy: schemas/meta_public/tables/api_modules/indexes/api_modules_api_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/api_modules/table

BEGIN;

CREATE INDEX api_modules_api_id_idx ON "meta_public".api_modules (api_id);
COMMIT;
