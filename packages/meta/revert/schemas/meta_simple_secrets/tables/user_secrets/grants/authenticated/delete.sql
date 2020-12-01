-- Revert: schemas/meta_simple_secrets/tables/user_secrets/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_simple_secrets".user_secrets FROM authenticated;
COMMIT;  

