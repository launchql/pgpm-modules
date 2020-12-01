-- Revert: schemas/meta_private/procedures/uuid_generate_seeded_uuid/grants/public from pg

BEGIN;


REVOKE EXECUTE ON FUNCTION
    "meta_private".uuid_generate_seeded_uuid
FROM public;
COMMIT;  

