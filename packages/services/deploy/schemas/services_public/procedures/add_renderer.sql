-- Deploy schemas/services_public/procedures/add_renderer to pg

-- requires: schemas/services_public/schema
-- requires: schemas/services_public/tables/services/table

BEGIN;

CREATE FUNCTION services_public.add_renderer(
  subdomain hostname,
  domain hostname,
  dbname text,
  name text DEFAULT null
) returns services_public.services as $$
DECLARE
  svc services_public.services;
BEGIN

  IF (name IS NULL) THEN 
    name = concat(subdomain, '.', domain);
  END IF;

  INSERT INTO services_public.services 
    (subdomain, domain, name, type, dbname)
  VALUES 
    (subdomain, domain, name, 'renderer', dbname)
  RETURNING * INTO svc;

  RETURN svc;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
