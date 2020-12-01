-- Revert: schemas/meta_public/tables/apis/columns/anon_role/column from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN anon_role;
COMMIT;  

