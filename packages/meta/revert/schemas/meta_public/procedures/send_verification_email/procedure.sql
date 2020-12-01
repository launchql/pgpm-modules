-- Revert: schemas/meta_public/procedures/send_verification_email/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".send_verification_email;
COMMIT;  

