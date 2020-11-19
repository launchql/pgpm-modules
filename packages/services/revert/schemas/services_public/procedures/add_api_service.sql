-- Revert schemas/services_public/procedures/add_api_service from pg

BEGIN;

DROP FUNCTION services_public.add_api_service;

COMMIT;
