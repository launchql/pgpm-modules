-- Revert: schemas/meta_public/tables/emails/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "meta_public".emails FROM authenticated;
COMMIT;  

