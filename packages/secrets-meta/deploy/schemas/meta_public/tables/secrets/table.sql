-- Deploy schemas/meta_public/tables/secrets/table to pg
-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table
-- requires: schemas/meta_public/tables/secret_providers/table

BEGIN;

CREATE TABLE IF NOT EXISTS meta_public.secrets (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),

  -- Ownership / scope
  owner_type text NOT NULL,         -- user | org | app | site
  owner_id uuid NOT NULL,
  app_id uuid NOT NULL,

  -- Logical key
  key text NOT NULL,

  -- Normalized key for uniqueness (lowercased or citext)
  key_normalized text NOT NULL,

  -- Provider linkage
  provider_id uuid NOT NULL,
  provider_ref text NOT NULL,

  description text,

  is_active boolean NOT NULL DEFAULT true,

  created_at timestamptz NOT NULL DEFAULT current_timestamp,
  updated_at timestamptz NOT NULL DEFAULT current_timestamp,
  rotated_at timestamptz
);

COMMENT ON TABLE meta_public.secrets IS
  'Metadata for user/org/app secrets; values live in external providers.';

COMMENT ON COLUMN meta_public.secrets.owner_type IS
  'Owner type for the secret: user, org, app, or site.';

COMMENT ON COLUMN meta_public.secrets.owner_id IS
  'ID of the owning user/org/app/site.';

COMMENT ON COLUMN meta_public.secrets.app_id IS
  'Logical app/database this secret is associated with.';

COMMENT ON COLUMN meta_public.secrets.key IS
  'Logical secret key name (e.g. MAILGUN_API_KEY).';

COMMENT ON COLUMN meta_public.secrets.key_normalized IS
  'Normalized form of key used for uniqueness (e.g. lower(key)).';

COMMENT ON COLUMN meta_public.secrets.provider_id IS
  'Foreign key to meta_public.secret_providers.';

COMMENT ON COLUMN meta_public.secrets.provider_ref IS
  'Opaque provider-specific reference/path (e.g. OpenBao KV path).';

ALTER TABLE meta_public.secrets
  ADD CONSTRAINT secrets_app_fkey
    FOREIGN KEY (app_id)
    REFERENCES meta_public.apps (id)
    ON DELETE CASCADE;

ALTER TABLE meta_public.secrets
  ADD CONSTRAINT secrets_provider_fkey
    FOREIGN KEY (provider_id)
    REFERENCES meta_public.secret_providers (id)
    ON DELETE RESTRICT;

CREATE UNIQUE INDEX IF NOT EXISTS secrets_owner_app_key_norm_uniq
  ON meta_public.secrets (owner_type, owner_id, app_id, key_normalized);

COMMIT;

