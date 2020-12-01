-- Revert: schemas/meta_public/tables/apps/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".apps FROM authenticated;
COMMIT;  

