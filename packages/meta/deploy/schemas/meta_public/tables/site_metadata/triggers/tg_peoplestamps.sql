-- Deploy: schemas/meta_public/tables/site_metadata/triggers/tg_peoplestamps to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/site_metadata/table
-- requires: schemas/meta_private/trigger_fns/tg_peoplestamps

BEGIN;

ALTER TABLE "meta_public".site_metadata ADD COLUMN created_by UUID;
ALTER TABLE "meta_public".site_metadata ADD COLUMN updated_by UUID;
CREATE TRIGGER tg_peoplestamps
BEFORE UPDATE OR INSERT ON "meta_public".site_metadata
FOR EACH ROW
EXECUTE PROCEDURE "meta_private".tg_peoplestamps();
COMMIT;
