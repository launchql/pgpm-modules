-- Revert: schemas/meta_public/tables/apis/columns/role_name/column from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN role_name;
COMMIT;  

