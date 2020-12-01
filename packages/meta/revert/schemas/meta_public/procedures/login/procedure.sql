-- Revert: schemas/meta_public/procedures/login/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".login;
COMMIT;  

