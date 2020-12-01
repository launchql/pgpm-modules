-- Deploy: schemas/meta_public/tables/api_modules/triggers/tg_timestamps to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_private/schema
-- requires: schemas/meta_public/tables/api_modules/table
-- requires: schemas/meta_private/trigger_fns/tg_timestamps

BEGIN;

ALTER TABLE "meta_public".api_modules ADD COLUMN created_at TIMESTAMPTZ;
ALTER TABLE "meta_public".api_modules ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE "meta_public".api_modules ADD COLUMN updated_at TIMESTAMPTZ;
ALTER TABLE "meta_public".api_modules ALTER COLUMN updated_at SET DEFAULT NOW();
CREATE TRIGGER tg_timestamps
BEFORE UPDATE OR INSERT ON "meta_public".api_modules
FOR EACH ROW
EXECUTE PROCEDURE "meta_private".tg_timestamps();
COMMIT;
