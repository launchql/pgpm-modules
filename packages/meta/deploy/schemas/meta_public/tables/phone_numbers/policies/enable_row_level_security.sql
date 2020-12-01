-- Deploy: schemas/meta_public/tables/phone_numbers/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table

BEGIN;

ALTER TABLE "meta_public".phone_numbers
    ENABLE ROW LEVEL SECURITY;
COMMIT;
