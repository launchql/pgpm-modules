-- Revert: schemas/meta_public/tables/emails/columns/id/alterations/alt0000000038 from pg

BEGIN;


ALTER TABLE "meta_public".emails 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

