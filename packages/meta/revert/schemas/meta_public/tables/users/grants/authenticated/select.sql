-- Revert: schemas/meta_public/tables/users/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".users FROM authenticated;
COMMIT;  

