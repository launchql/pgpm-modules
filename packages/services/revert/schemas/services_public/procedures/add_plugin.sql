-- Revert schemas/services_public/procedures/add_plugin from pg

BEGIN;

DROP FUNCTION services_public.add_plugin;

COMMIT;
