-- Revert: schemas/meta_public/tables/emails/table from pg

BEGIN;
DROP TABLE "meta_public".emails;
COMMIT;  

