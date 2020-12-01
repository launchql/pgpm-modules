-- Revert: schemas/meta_public/tables/organization_settings/alterations/alt0000000066 from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

