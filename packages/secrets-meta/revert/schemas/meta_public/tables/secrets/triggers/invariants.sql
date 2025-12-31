-- Revert schemas/meta_public/tables/secrets/triggers/invariants from pg

BEGIN;

DROP TRIGGER IF EXISTS secrets_invariants_before_tg ON meta_public.secrets;
DROP FUNCTION IF EXISTS meta_public.secrets_invariants_tg();

COMMIT;

