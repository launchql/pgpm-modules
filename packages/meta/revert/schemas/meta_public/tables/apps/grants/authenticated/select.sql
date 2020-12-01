-- Revert: schemas/meta_public/tables/apps/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".apps FROM authenticated;
COMMIT;  

