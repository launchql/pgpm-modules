-- Revert: schemas/meta_public/tables/domains/columns/subdomain/column from pg

BEGIN;


ALTER TABLE "meta_public".domains DROP COLUMN subdomain;
COMMIT;  

