-- Revert: schemas/meta_private/procedures/uuid_generate_v4/procedure from pg

BEGIN;


DROP FUNCTION "meta_private".uuid_generate_v4;
COMMIT;  

