-- Deploy: schemas/meta_public/grants/usage/anonymous to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema

BEGIN;

GRANT USAGE
ON SCHEMA "meta_public"
TO anonymous;
COMMIT;
