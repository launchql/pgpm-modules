-- Revert: schemas/meta_public/procedures/get_current_group_ids/grants/authenticated from pg

BEGIN;


REVOKE EXECUTE ON FUNCTION
    "meta_public".get_current_group_ids
FROM authenticated;
COMMIT;  

