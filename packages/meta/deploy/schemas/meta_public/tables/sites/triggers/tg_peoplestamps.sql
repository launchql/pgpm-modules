-- Deploy: schemas/meta_public/tables/sites/triggers/tg_peoplestamps to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/sites/table
-- requires: schemas/meta_private/trigger_fns/tg_peoplestamps

BEGIN;

ALTER TABLE "meta_public".sites ADD COLUMN created_by UUID;
ALTER TABLE "meta_public".sites ADD COLUMN updated_by UUID;
CREATE TRIGGER tg_peoplestamps
BEFORE UPDATE OR INSERT ON "meta_public".sites
FOR EACH ROW
EXECUTE PROCEDURE "meta_private".tg_peoplestamps();
COMMIT;
