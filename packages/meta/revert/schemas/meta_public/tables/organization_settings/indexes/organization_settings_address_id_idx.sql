-- Revert: schemas/meta_public/tables/organization_settings/indexes/organization_settings_address_id_idx from pg

BEGIN;


DROP INDEX "meta_public".organization_settings_address_id_idx;

COMMIT;  

