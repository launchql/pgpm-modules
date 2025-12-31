-- Deploy schemas/meta_private/procedures/get_job_secrets_metadata to pg
-- requires: schemas/meta_private/schema
-- requires: pgpm-database-jobs:schemas/app_jobs/tables/jobs/table
-- requires: schemas/meta_public/tables/secrets/table
-- requires: schemas/meta_public/tables/secret_providers/table
-- requires: db-meta-schema:schemas/meta_public/tables/apps/table

BEGIN;

CREATE OR REPLACE FUNCTION meta_private.get_job_secrets_metadata(
  in_job_id bigint
)
RETURNS TABLE (
  secret_id uuid,
  key text,
  provider_type text,
  provider_config jsonb,
  provider_ref text,
  app_id uuid,
  database_id uuid,
  task_identifier text
)
LANGUAGE sql
SECURITY DEFINER
AS $$
  WITH job_row AS (
    SELECT
      j.id,
      j.database_id,
      j.task_identifier,
      j.payload
    FROM app_jobs.jobs j
    WHERE j.id = in_job_id
  ),
  refs AS (
    SELECT
      jr.database_id,
      jr.task_identifier,
      (each_ref).key   AS ref_key,
      (each_ref).value AS ref_value
    FROM job_row jr,
         LATERAL json_each(jr.payload -> 'secretRefs') AS each_ref(key, value)
  ),
  resolved AS (
    SELECT
      s.id            AS secret_id,
      s.key,
      sp.provider_type,
      sp.config       AS provider_config,
      s.provider_ref,
      s.app_id,
      a.database_id,
      r.task_identifier
    FROM refs r
    JOIN meta_public.secrets s
      ON s.owner_type     = (r.ref_value ->> 'ownerType')
     AND s.owner_id       = (r.ref_value ->> 'ownerId')::uuid
     AND s.app_id         = (r.ref_value ->> 'appId')::uuid
     AND s.key_normalized = lower(r.ref_value ->> 'key')
    JOIN meta_public.secret_providers sp
      ON sp.id = s.provider_id
    JOIN meta_public.apps a
      ON a.id = s.app_id
     AND a.database_id = r.database_id
    WHERE sp.is_active
  )
  SELECT
    secret_id,
    key,
    provider_type,
    provider_config,
    provider_ref,
    app_id,
    database_id,
    task_identifier
  FROM resolved;
$$;

COMMIT;

