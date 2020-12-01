-- Revert: schemas/meta_public/tables/users/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".users FROM authenticated;
COMMIT;  

