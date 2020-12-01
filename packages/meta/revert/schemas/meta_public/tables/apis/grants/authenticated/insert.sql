-- Revert: schemas/meta_public/tables/apis/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".apis FROM authenticated;
COMMIT;  

