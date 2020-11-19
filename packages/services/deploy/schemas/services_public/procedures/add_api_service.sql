-- Deploy schemas/services_public/procedures/add_api_service to pg

-- requires: schemas/services_public/schema
-- requires: schemas/services_public/tables/services/table

BEGIN;

CREATE FUNCTION services_public.add_api_service(
  subdomain hostname,
  domain hostname,
  dbname text,
  role_name text,
  anon_role text,
  schemas text[],
  name text DEFAULT null
) returns services_public.services as $$
DECLARE
  svc services_public.services;
  datum jsonb = '{}'::jsonb;
BEGIN

  IF (name IS NULL) THEN 
    name = concat(subdomain, '.', domain);
  END IF;

  datum = jsonb_set(
    datum,
    ARRAY['graphile']::text[],
    '{}'::jsonb
  );

  datum = jsonb_set(
    datum,
    ARRAY['graphile', 'role_name']::text[],
    to_jsonb(role_name)
  );

  datum = jsonb_set(
    datum,
    ARRAY['graphile', 'anon_role']::text[],
    to_jsonb(anon_role)
  );

  datum = jsonb_set(
    datum,
    ARRAY['graphile', 'schemas']::text[],
    to_jsonb(schemas)
  );

  INSERT INTO services_public.services 
    (subdomain, domain, name, type, dbname, data)
  VALUES 
    (subdomain, domain, name, 'api', dbname, datum)
  RETURNING * INTO svc;

  RETURN svc;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
