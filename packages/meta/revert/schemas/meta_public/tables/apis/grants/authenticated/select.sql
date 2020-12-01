-- Revert: schemas/meta_public/tables/apis/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".apis FROM authenticated;
COMMIT;  

