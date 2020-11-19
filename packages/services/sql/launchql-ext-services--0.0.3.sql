\echo Use "CREATE EXTENSION launchql-ext-services" to load this file. \quit
CREATE SCHEMA services_public;

CREATE TABLE services_public.services (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	type text,
	name text,
	subdomain hostname,
	domain hostname NOT NULL,
	dbname text,
	data jsonb NOT NULL DEFAULT ( '{}'::jsonb ),
	UNIQUE ( subdomain, domain ) 
);

CREATE INDEX ON services_public.services ( type );

CREATE FUNCTION services_public.add_api_service ( subdomain hostname, domain hostname, dbname text, role_name text, anon_role text, schemas text[], name text DEFAULT NULL ) RETURNS services_public.services AS $EOFCODE$
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
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION services_public.add_plugin ( v_subdomain hostname, v_domain hostname, v_name text, v_data jsonb ) RETURNS services_public.services AS $EOFCODE$
DECLARE
  svc services_public.services;
  newdata jsonb;
BEGIN

  SELECT * FROM services_public.services
  WHERE 
    subdomain = v_subdomain
    AND domain = v_domain 
  INTO svc;

  IF (NOT FOUND) THEN 
    RAISE EXCEPTION 'NOT_FOUND';
  END IF;

  newdata = jsonb_set(svc.data, ARRAY[v_name]::text[], v_data);
  
  UPDATE services_public.services 
    SET data = newdata
  WHERE id = svc.id
  RETURNING * INTO svc;

  RETURN svc;
END;
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION services_public.add_renderer ( subdomain hostname, domain hostname, dbname text, name text DEFAULT NULL ) RETURNS services_public.services AS $EOFCODE$
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
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION services_public.remove_plugin ( v_subdomain hostname, v_domain hostname, v_name text ) RETURNS services_public.services AS $EOFCODE$
DECLARE
  svc services_public.services;
  newdata jsonb;
BEGIN

  SELECT * FROM services_public.services
  WHERE 
    subdomain = v_subdomain
    AND domain = v_domain 
  INTO svc;

  IF (NOT FOUND) THEN 
    RAISE EXCEPTION 'NOT_FOUND';
  END IF;

  newdata = svc.data - v_name;
  
  UPDATE services_public.services 
    SET data = newdata
  WHERE id = svc.id
  RETURNING * INTO svc;

  RETURN svc;
END;
$EOFCODE$ LANGUAGE plpgsql VOLATILE;