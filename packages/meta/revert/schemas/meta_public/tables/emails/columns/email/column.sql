-- Revert: schemas/meta_public/tables/emails/columns/email/column from pg

BEGIN;


ALTER TABLE "meta_public".emails DROP COLUMN email;
COMMIT;  

