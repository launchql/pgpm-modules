-- Deploy: schemas/meta_public/procedures/get_current_user_id/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema

BEGIN;

CREATE FUNCTION "meta_public".get_current_user_id ()
  RETURNS uuid
AS $$
DECLARE
  v_identifier_id uuid;
BEGIN
  IF current_setting('jwt.claims.user_id', TRUE)
    IS NOT NULL THEN
    BEGIN
      v_identifier_id = current_setting('jwt.claims.user_id', TRUE)::uuid;
    EXCEPTION
      WHEN OTHERS THEN
      RAISE NOTICE 'Invalid UUID value';
    RETURN NULL;
    END;
    RETURN v_identifier_id;
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE 'plpgsql' STABLE;
COMMIT;
