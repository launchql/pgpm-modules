-- Deploy schemas/services_public/procedures/remove_plugin to pg

-- requires: schemas/services_public/schema
-- requires: schemas/services_public/tables/services/table

BEGIN;

CREATE FUNCTION services_public.remove_plugin(
  v_subdomain hostname,
  v_domain hostname,
  v_name text
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

  newdata = svc.data - v_name;
  
  UPDATE services_public.services 
    SET data = newdata
  WHERE id = svc.id
  RETURNING * INTO svc;

  RETURN svc;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
