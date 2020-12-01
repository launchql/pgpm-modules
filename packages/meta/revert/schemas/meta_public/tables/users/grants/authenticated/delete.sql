-- Revert: schemas/meta_public/tables/users/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "meta_public".users FROM authenticated;
COMMIT;  

