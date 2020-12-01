-- Revert: schemas/meta_public/tables/apps/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".apps FROM authenticated;
COMMIT;  

