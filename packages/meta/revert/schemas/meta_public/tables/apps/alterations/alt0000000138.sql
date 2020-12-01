-- Revert: schemas/meta_public/tables/apps/alterations/alt0000000138 from pg

BEGIN;


ALTER TABLE "meta_public".apps
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

