-- Deploy: schemas/meta_private/procedures/seeded_uuid_related_trigger/grants/public to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema
-- requires: schemas/meta_private/procedures/seeded_uuid_related_trigger/procedure

BEGIN;

GRANT EXECUTE ON FUNCTION
    "meta_private".seeded_uuid_related_trigger
TO public;
COMMIT;
