-- Deploy: schemas/meta_public/tables/phone_numbers/columns/country_code/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table

BEGIN;

ALTER TABLE "meta_public".phone_numbers ADD COLUMN country_code int;
COMMIT;
