-- Revert: schemas/meta_private/tables/api_tokens/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_private".api_tokens FROM authenticated;
COMMIT;  

