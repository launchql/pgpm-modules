-- Deploy schemas/meta_public/tables/secret_providers/table to pg
-- requires: schemas/meta_public/schema

BEGIN;

CREATE TABLE IF NOT EXISTS meta_public.secret_providers (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name text NOT NULL,
  provider_type text NOT NULL,
  config jsonb NOT NULL DEFAULT '{}'::jsonb,
  description text,
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT current_timestamp,
  updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

COMMENT ON TABLE meta_public.secret_providers IS
  'Registry of secret provider backends (OpenBao, k8s, etc).';

COMMENT ON COLUMN meta_public.secret_providers.name IS
  'Human-readable name for this secret provider.';

COMMENT ON COLUMN meta_public.secret_providers.provider_type IS
  'Provider type identifier (e.g. openbao, k8s, aws_secrets_manager).';

COMMENT ON COLUMN meta_public.secret_providers.config IS
  'Provider-specific configuration (JSON), such as endpoints, mounts, roles.';

COMMENT ON COLUMN meta_public.secret_providers.is_active IS
  'Whether this provider is currently active/usable.';

COMMIT;

