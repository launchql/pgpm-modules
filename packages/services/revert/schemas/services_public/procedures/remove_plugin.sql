-- Revert schemas/services_public/procedures/remove_plugin from pg

BEGIN;

DROP FUNCTION services_public.remove_plugin;

COMMIT;
