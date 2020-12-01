-- Revert: schemas/meta_private/procedures/seeded_uuid_related_trigger/procedure from pg

BEGIN;


DROP FUNCTION "meta_private".seeded_uuid_related_trigger;
COMMIT;  

