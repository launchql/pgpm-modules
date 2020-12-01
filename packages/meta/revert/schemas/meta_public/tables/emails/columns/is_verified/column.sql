-- Revert: schemas/meta_public/tables/emails/columns/is_verified/column from pg

BEGIN;


ALTER TABLE "meta_public".emails DROP COLUMN is_verified;
COMMIT;  

