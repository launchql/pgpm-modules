-- Revert: schemas/meta_public/tables/emails/columns/user_id/column from pg

BEGIN;


ALTER TABLE "meta_public".emails DROP COLUMN user_id;
COMMIT;  

