-- Revert schemas/services_public/procedures/add_renderer from pg

BEGIN;

DROP FUNCTION services_public.add_renderer;

COMMIT;
