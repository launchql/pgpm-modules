-- Revert: schemas/meta_public/tables/emails/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "meta_public".emails FROM authenticated;
COMMIT;  

