-- Deploy: schemas/meta_public/tables/emails/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/emails/table

BEGIN;
GRANT SELECT ON TABLE "meta_public".emails TO authenticated;
COMMIT;
