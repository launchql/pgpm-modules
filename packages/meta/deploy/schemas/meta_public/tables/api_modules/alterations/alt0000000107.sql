-- Deploy: schemas/meta_public/tables/api_modules/alterations/alt0000000107 to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/api_modules/table

BEGIN;

ALTER TABLE "meta_public".api_modules
    DISABLE ROW LEVEL SECURITY;
COMMIT;
