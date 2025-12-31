-- Deploy schemas/meta_public/procedures/secret_metadata to pg
-- requires: schemas/meta_public/tables/secrets/table

BEGIN;

CREATE OR REPLACE FUNCTION meta_public.create_secret_metadata(
  in_owner_type text,
  in_owner_id uuid,
  in_app_id uuid,
  in_key text,
  in_provider_id uuid,
  in_provider_ref text,
  in_description text DEFAULT NULL
)
RETURNS meta_public.secrets
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_secret meta_public.secrets;
BEGIN
  IF in_owner_type NOT IN ('user', 'org', 'app', 'site') THEN
    RAISE EXCEPTION 'invalid owner_type %', in_owner_type;
  END IF;

  INSERT INTO meta_public.secrets (
    owner_type,
    owner_id,
    app_id,
    key,
    provider_id,
    provider_ref,
    description
  ) VALUES (
    in_owner_type,
    in_owner_id,
    in_app_id,
    in_key,
    in_provider_id,
    in_provider_ref,
    in_description
  )
  RETURNING * INTO v_secret;

  RETURN v_secret;
END;
$$;


CREATE OR REPLACE FUNCTION meta_public.rotate_secret_metadata(
  in_secret_id uuid
)
RETURNS meta_public.secrets
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_secret meta_public.secrets;
BEGIN
  UPDATE meta_public.secrets s
  SET rotated_at = current_timestamp,
      updated_at = current_timestamp
  WHERE s.id = in_secret_id
  RETURNING * INTO v_secret;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'secret % not found', in_secret_id;
  END IF;

  RETURN v_secret;
END;
$$;


CREATE OR REPLACE FUNCTION meta_public.delete_secret_metadata(
  in_secret_id uuid
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  DELETE FROM meta_public.secrets s
  WHERE s.id = in_secret_id;
END;
$$;

COMMIT;

