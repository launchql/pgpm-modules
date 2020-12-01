-- Revert: schemas/meta_private/procedures/seeded_uuid_related_trigger/grants/public from pg

BEGIN;


REVOKE EXECUTE ON FUNCTION
    "meta_private".seeded_uuid_related_trigger
FROM public;
COMMIT;  

