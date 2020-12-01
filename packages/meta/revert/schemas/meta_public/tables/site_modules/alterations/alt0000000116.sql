-- Revert: schemas/meta_public/tables/site_modules/alterations/alt0000000116 from pg

BEGIN;


ALTER TABLE "meta_public".site_modules
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

