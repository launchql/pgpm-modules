-- Deploy: schemas/meta_public/tables/apps/indexes/apps_owner_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;

CREATE INDEX apps_owner_id_idx ON "meta_public".apps (owner_id);
COMMIT;
