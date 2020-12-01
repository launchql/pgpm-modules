-- Revert: schemas/meta_public/alterations/alt0000000108 from pg

BEGIN;
COMMENT ON CONSTRAINT sites_domain_id_key ON "meta_public".sites IS NULL;
COMMIT;  

