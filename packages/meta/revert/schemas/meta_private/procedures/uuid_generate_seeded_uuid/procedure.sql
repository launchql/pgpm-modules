-- Revert: schemas/meta_private/procedures/uuid_generate_seeded_uuid/procedure from pg

BEGIN;


DROP FUNCTION "meta_private".uuid_generate_seeded_uuid;
COMMIT;  

