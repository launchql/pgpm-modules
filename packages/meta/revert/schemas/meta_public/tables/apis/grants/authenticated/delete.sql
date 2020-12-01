-- Revert: schemas/meta_public/tables/apis/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".apis FROM authenticated;
COMMIT;  

