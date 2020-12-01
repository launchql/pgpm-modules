-- Revert: schemas/meta_public/tables/sites/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".sites FROM authenticated;
COMMIT;  

