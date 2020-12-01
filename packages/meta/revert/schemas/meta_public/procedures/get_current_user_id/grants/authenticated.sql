-- Revert: schemas/meta_public/procedures/get_current_user_id/grants/authenticated from pg

BEGIN;


REVOKE EXECUTE ON FUNCTION
    "meta_public".get_current_user_id
FROM authenticated;
COMMIT;  

