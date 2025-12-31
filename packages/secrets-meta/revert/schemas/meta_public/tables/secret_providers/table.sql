-- Revert schemas/meta_public/tables/secret_providers/table from pg

BEGIN;

DROP TABLE IF EXISTS meta_public.secret_providers CASCADE;

COMMIT;

