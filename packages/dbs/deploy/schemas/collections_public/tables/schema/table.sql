-- Deploy schemas/collections_public/tables/schema/table to pg

-- requires: schemas/collections_public/schema
-- requires: schemas/collections_public/tables/database/table

BEGIN;

CREATE TABLE collections_public.schema (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    database_id uuid NOT NULL REFERENCES collections_public.database(id) ON DELETE CASCADE,
    name text NOT NULL,
    schema_name text NOT NULL,
    description text,
    created_at timestamptz,
    updated_at timestamptz,
    UNIQUE (database_id, name),
    UNIQUE (schema_name)
);

ALTER TABLE collections_public.schema
  ADD CONSTRAINT schema_namechk CHECK (char_length(name) > 2);

COMMIT;
