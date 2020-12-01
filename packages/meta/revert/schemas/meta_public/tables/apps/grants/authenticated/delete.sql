-- Revert: schemas/meta_public/tables/apps/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".apps FROM authenticated;
COMMIT;  

