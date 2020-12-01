-- Deploy: schemas/meta_public/tables/phone_numbers/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".phone_numbers TO authenticated;
COMMIT;
