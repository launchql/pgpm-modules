-- Deploy: schemas/meta_public/procedures/get_current_group_ids/grants/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/procedures/get_current_group_ids/procedure

BEGIN;

GRANT EXECUTE ON FUNCTION
    "meta_public".get_current_group_ids
TO authenticated;
COMMIT;
