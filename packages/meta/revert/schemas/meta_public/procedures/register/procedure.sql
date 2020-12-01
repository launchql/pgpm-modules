-- Revert: schemas/meta_public/procedures/register/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".register;

COMMIT;  

