-- Deploy schemas/meta_public/tables/secrets/triggers/invariants to pg
-- requires: schemas/meta_public/tables/secrets/table

BEGIN;

CREATE OR REPLACE FUNCTION meta_public.secrets_invariants_tg()
RETURNS trigger AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    -- Normalize key
    NEW.key_normalized := lower(NEW.key);

    -- Timestamps
    IF NEW.created_at IS NULL THEN
      NEW.created_at := current_timestamp;
    END IF;
    IF NEW.updated_at IS NULL THEN
      NEW.updated_at := current_timestamp;
    END IF;

  ELSIF TG_OP = 'UPDATE' THEN
    -- Normalize key
    NEW.key_normalized := lower(NEW.key);

    -- Prevent provider_ref changes
    IF NEW.provider_ref IS DISTINCT FROM OLD.provider_ref THEN
      RAISE EXCEPTION 'provider_ref is immutable for secret %', OLD.id;
    END IF;

    -- Maintain updated_at
    NEW.updated_at := current_timestamp;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql VOLATILE;

DROP TRIGGER IF EXISTS secrets_invariants_before_tg ON meta_public.secrets;

CREATE TRIGGER secrets_invariants_before_tg
  BEFORE INSERT OR UPDATE ON meta_public.secrets
  FOR EACH ROW
  EXECUTE PROCEDURE meta_public.secrets_invariants_tg();

COMMIT;

