-- Deploy: schemas/meta_simple_secrets/tables/user_secrets/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_simple_secrets/schema
-- requires: schemas/meta_simple_secrets/tables/user_secrets/table

BEGIN;
GRANT UPDATE ON TABLE "meta_simple_secrets".user_secrets TO authenticated;
COMMIT;
