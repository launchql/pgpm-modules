-- Revert schemas/meta_private/procedures/get_job_secrets_metadata from pg

BEGIN;

DROP FUNCTION IF EXISTS meta_private.get_job_secrets_metadata(bigint);

COMMIT;

