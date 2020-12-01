-- Deploy: schemas/meta_private/grants/usage/anonymous to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_private/schema

BEGIN;

GRANT USAGE
ON SCHEMA "meta_private"
TO anonymous;
COMMIT;
