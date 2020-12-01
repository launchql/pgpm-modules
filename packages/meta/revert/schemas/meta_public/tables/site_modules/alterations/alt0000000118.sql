-- Revert: schemas/meta_public/tables/site_modules/alterations/alt0000000118 from pg

BEGIN;


ALTER TABLE "meta_public".site_modules
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

