-- Verify launchql-extension-defaults:defaults/public on pg
BEGIN;
SELECT
    1 / count(*)
FROM
    pg_default_acl
WHERE
    defaclnamespace = 0::oid;
ROLLBACK;

