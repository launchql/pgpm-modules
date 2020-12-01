-- Revert: schemas/meta_private/tables/api_tokens/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_private".api_tokens FROM authenticated;
COMMIT;  

