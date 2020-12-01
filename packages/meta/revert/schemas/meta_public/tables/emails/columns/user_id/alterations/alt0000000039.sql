-- Revert: schemas/meta_public/tables/emails/columns/user_id/alterations/alt0000000039 from pg

BEGIN;


ALTER TABLE "meta_public".emails 
    ALTER COLUMN user_id DROP NOT NULL;


COMMIT;  

