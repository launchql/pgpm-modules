-- Deploy: schemas/meta_public/tables/emails/grants/authenticated/delete to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/emails/table

BEGIN;
GRANT DELETE ON TABLE "meta_public".emails TO authenticated;
COMMIT;
