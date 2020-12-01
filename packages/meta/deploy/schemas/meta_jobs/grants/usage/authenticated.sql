-- Deploy: schemas/meta_jobs/grants/usage/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_jobs/schema

BEGIN;

GRANT USAGE
ON SCHEMA "meta_jobs"
TO authenticated;
COMMIT;
