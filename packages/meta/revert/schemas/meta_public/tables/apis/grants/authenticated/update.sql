-- Revert: schemas/meta_public/tables/apis/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".apis FROM authenticated;
COMMIT;  

