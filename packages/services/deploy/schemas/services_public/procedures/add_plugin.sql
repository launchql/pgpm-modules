-- Deploy schemas/services_public/procedures/add_plugin to pg

-- requires: schemas/services_public/schema
-- requires: schemas/services_public/tables/services/table

BEGIN;

CREATE FUNCTION services_public.add_plugin(
  v_subdomain hostname,
  v_domain hostname,
  v_name text,
  v_data jsonb
) returns services_public.services as $$
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
$$
LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
