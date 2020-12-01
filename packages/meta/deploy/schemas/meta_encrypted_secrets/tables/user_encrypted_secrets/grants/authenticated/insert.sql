-- Deploy: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/grants/authenticated/insert to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/table

BEGIN;
GRANT INSERT ON TABLE "meta_encrypted_secrets".user_encrypted_secrets TO authenticated;
COMMIT;
