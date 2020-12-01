-- Revert: schemas/meta_public/tables/addresses/alterations/alt0000000046 from pg

BEGIN;


ALTER TABLE "meta_public".addresses
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

