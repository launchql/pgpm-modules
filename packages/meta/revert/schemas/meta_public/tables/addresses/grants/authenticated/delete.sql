-- Revert: schemas/meta_public/tables/addresses/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".addresses FROM authenticated;
COMMIT;  

