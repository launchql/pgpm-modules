-- Verify schemas/services_public/procedures/add_api_service  on pg

BEGIN;

SELECT verify_function ('services_public.add_api_service');

ROLLBACK;
