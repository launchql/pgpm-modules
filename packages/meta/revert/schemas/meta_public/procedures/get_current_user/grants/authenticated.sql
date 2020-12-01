-- Revert: schemas/meta_public/procedures/get_current_user/grants/authenticated from pg

BEGIN;


REVOKE EXECUTE ON FUNCTION
    "meta_public".get_current_user
FROM authenticated;
COMMIT;  

