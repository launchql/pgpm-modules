-- Deploy schemas/services_public/procedures/add_service to pg

-- requires: schemas/services_public/schema
-- requires: schemas/services_public/tables/services/table

BEGIN;

CREATE FUNCTION services_public.add_service(
  v_subdomain hostname,
  v_domain hostname,
  v_dbname text,
  v_type text,
  v_name text DEFAULT null,
  v_database_id uuid DEFAULT null
) returns services_public.services as $$
DECLARE
  svc services_public.services;
BEGIN

  IF (v_name IS NULL) THEN 
    IF (v_subdomain IS NULL) THEN 
      v_name = concat(v_domain);
    ELSE
      v_name = concat(v_subdomain, '.', v_domain);
    END IF;
  END IF;

  INSERT INTO services_public.services 
    (subdomain, domain, name, type, dbname, database_id)
  VALUES 
    (v_subdomain, v_domain, v_name, v_type, v_dbname, v_database_id)
  ON CONFLICT (subdomain, domain)
  DO UPDATE SET 
    database_id = EXCLUDED.database_id,
    name = EXCLUDED.name,
    type = EXCLUDED.type,
    dbname = EXCLUDED.dbname
  RETURNING * INTO svc;

  RETURN svc;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
