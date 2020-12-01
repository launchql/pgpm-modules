-- Revert: schemas/meta_public/tables/emails/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "meta_public".emails FROM authenticated;
COMMIT;  

