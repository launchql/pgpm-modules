-- Revert: schemas/meta_public/tables/emails/columns/id/column from pg

BEGIN;


ALTER TABLE "meta_public".emails DROP COLUMN id;
COMMIT;  

