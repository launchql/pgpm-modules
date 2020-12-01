-- Deploy: schemas/meta_public/tables/organization_settings/triggers/tg_peoplestamps to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_private/trigger_fns/tg_peoplestamps
-- requires: schemas/meta_public/tables/organization_settings/table

BEGIN;

ALTER TABLE "meta_public".organization_settings ADD COLUMN created_by UUID;
ALTER TABLE "meta_public".organization_settings ADD COLUMN updated_by UUID;
CREATE TRIGGER tg_peoplestamps
BEFORE UPDATE OR INSERT ON "meta_public".organization_settings
FOR EACH ROW
EXECUTE PROCEDURE "meta_private".tg_peoplestamps();
COMMIT;
