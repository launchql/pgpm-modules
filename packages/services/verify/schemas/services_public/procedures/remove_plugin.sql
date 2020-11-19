-- Verify schemas/services_public/procedures/remove_plugin  on pg

BEGIN;

SELECT verify_function ('services_public.remove_plugin');

ROLLBACK;
