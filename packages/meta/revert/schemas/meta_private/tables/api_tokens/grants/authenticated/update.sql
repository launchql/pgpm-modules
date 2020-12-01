-- Revert: schemas/meta_private/tables/api_tokens/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_private".api_tokens FROM authenticated;
COMMIT;  

