-- Revert: schemas/meta_public/tables/users/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".users FROM authenticated;
COMMIT;  

