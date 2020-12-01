-- Deploy: schemas/meta_encrypted_secrets/procedures/get/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_encrypted_secrets/schema
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/table
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/value/column
-- requires: schemas/meta_encrypted_secrets/tables/user_encrypted_secrets/columns/user_id/column

BEGIN;

CREATE FUNCTION "meta_encrypted_secrets".get (
  user_id uuid,
  secret_name text,
  default_value text default null
)
  RETURNS text
  AS $$
DECLARE
  v_secret "meta_encrypted_secrets".user_encrypted_secrets;
BEGIN
  SELECT
    *
  FROM
    "meta_encrypted_secrets".user_encrypted_secrets s
  WHERE
    s.name = get.secret_name
    AND s.user_id = get.user_id
  INTO v_secret;
  IF (NOT FOUND OR v_secret IS NULL) THEN
    RETURN get.default_value;
  END IF;
  
  IF (v_secret.enc = 'crypt') THEN
    RETURN convert_from(v_secret.value, 'SQL_ASCII');
  ELSIF (v_secret.enc = 'pgp') THEN
    RETURN convert_from(decode(pgp_sym_decrypt(v_secret.value, v_secret.user_id::text), 'hex'), 'SQL_ASCII');
  END IF;
  RETURN convert_from(v_secret.value, 'SQL_ASCII');
END
$$
LANGUAGE 'plpgsql'
STABLE;
COMMIT;
