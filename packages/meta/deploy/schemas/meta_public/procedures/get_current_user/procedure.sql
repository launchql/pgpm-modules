-- Deploy: schemas/meta_public/procedures/get_current_user/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/users/table

BEGIN;

CREATE FUNCTION "meta_public".get_current_user()
    RETURNS "meta_public".users
AS $$
DECLARE
  v_user "meta_public".users;
BEGIN
  IF "meta_public".get_current_user_id() IS NOT NULL THEN
     SELECT * FROM "meta_public".users WHERE id = "meta_public".get_current_user_id() INTO v_user;
     RETURN v_user;
  ELSE
     RETURN NULL;
  END IF;
END;
$$
LANGUAGE 'plpgsql' STABLE;
COMMIT;
