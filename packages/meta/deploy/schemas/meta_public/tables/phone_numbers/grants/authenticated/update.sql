-- Deploy: schemas/meta_public/tables/phone_numbers/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table

BEGIN;
GRANT UPDATE ON TABLE "meta_public".phone_numbers TO authenticated;
COMMIT;
