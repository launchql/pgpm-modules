-- Deploy: schemas/meta_simple_secrets/tables/user_secrets/columns/user_id/alterations/alt0000000014 to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_simple_secrets/schema
-- requires: schemas/meta_simple_secrets/tables/user_secrets/table
-- requires: schemas/meta_simple_secrets/tables/user_secrets/columns/user_id/column

BEGIN;

ALTER TABLE "meta_simple_secrets".user_secrets 
    ALTER COLUMN user_id SET NOT NULL;
COMMIT;
