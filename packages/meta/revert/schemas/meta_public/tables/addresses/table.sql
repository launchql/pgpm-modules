-- Revert: schemas/meta_public/tables/addresses/table from pg

BEGIN;
DROP TABLE "meta_public".addresses;
COMMIT;  

