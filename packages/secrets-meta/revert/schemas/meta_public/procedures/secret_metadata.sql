-- Revert schemas/meta_public/procedures/secret_metadata from pg

BEGIN;

DROP FUNCTION IF EXISTS meta_public.delete_secret_metadata(uuid);
DROP FUNCTION IF EXISTS meta_public.rotate_secret_metadata(uuid);
DROP FUNCTION IF EXISTS meta_public.create_secret_metadata(
  text,
  uuid,
  uuid,
  text,
  uuid,
  text,
  text
);

COMMIT;

