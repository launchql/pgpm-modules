-- Revert: schemas/meta_public/tables/api_modules/alterations/alt0000000111 from pg

BEGIN;


ALTER TABLE "meta_public".api_modules
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

