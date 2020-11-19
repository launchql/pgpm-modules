-- Deploy schemas/services_public/tables/services/table to pg
-- requires: schemas/services_public/schema

BEGIN;

CREATE TABLE services_public.services (
  id uuid PRIMARY KEY DEFAULT (uuid_generate_v4 ()),

  type text,
  name text,

  subdomain hostname,
  domain hostname NOT NULL,
  dbname text,
  
  data jsonb NOT NULL default '{}'::jsonb,

  UNIQUE (subdomain, domain)
);

CREATE INDEX ON services_public.services ( type );

COMMIT;

