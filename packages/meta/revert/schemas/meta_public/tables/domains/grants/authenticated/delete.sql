-- Revert: schemas/meta_public/tables/domains/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".domains FROM authenticated;
COMMIT;  

