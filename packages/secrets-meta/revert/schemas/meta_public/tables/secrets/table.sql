-- Revert schemas/meta_public/tables/secrets/table from pg

BEGIN;

DROP TABLE IF EXISTS meta_public.secrets CASCADE;

COMMIT;

