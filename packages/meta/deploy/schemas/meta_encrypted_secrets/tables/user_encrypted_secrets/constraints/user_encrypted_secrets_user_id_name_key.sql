-- Deploy: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/constraints/user_encrypted_secrets_user_id_name_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/table

BEGIN;

ALTER TABLE "meta_encrypted_secrets".user_encrypted_secrets
    ADD CONSTRAINT user_encrypted_secrets_user_id_name_key UNIQUE (user_id,name);
COMMIT;
