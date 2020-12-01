-- Deploy: schemas/meta_public/tables/apps/columns/id/alterations/alt0000000140 to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table
-- requires: schemas/meta_public/tables/apps/columns/id/column

BEGIN;

ALTER TABLE "meta_public".apps 
    ALTER COLUMN id SET DEFAULT "meta_private".uuid_generate_v4();
COMMIT;
