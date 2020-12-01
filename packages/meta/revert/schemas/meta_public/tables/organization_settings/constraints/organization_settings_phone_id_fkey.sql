-- Revert: schemas/meta_public/tables/organization_settings/constraints/organization_settings_phone_id_fkey from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings 
    DROP CONSTRAINT organization_settings_phone_id_fkey;

COMMIT;  

