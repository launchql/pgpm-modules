-- Revert: schemas/meta_private/tables/api_tokens/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_private".api_tokens FROM authenticated;
COMMIT;  

