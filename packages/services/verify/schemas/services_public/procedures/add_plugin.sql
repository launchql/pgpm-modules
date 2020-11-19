-- Verify schemas/services_public/procedures/add_plugin  on pg

BEGIN;

SELECT verify_function ('services_public.add_plugin');

ROLLBACK;
