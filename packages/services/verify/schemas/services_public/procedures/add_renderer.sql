-- Verify schemas/services_public/procedures/add_renderer  on pg

BEGIN;

SELECT verify_function ('services_public.add_renderer');

ROLLBACK;
