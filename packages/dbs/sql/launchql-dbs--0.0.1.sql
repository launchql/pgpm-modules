\echo Use "CREATE EXTENSION launchql-dbs" to load this file. \quit
CREATE SCHEMA collections_private;

CREATE SCHEMA collections_public;

CREATE TABLE collections_public.database (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	owner_id uuid,
	schema_hash text,
	schema_name text,
	private_schema_name text,
	name text,
	created_at timestamptz,
	updated_at timestamptz,
	UNIQUE ( schema_hash ),
	UNIQUE ( schema_name ),
	UNIQUE ( private_schema_name ) 
);

ALTER TABLE collections_public.database ADD CONSTRAINT db_namechk CHECK ( char_length(name) > 2 );

COMMENT ON COLUMN collections_public.database.schema_hash IS E'@omit';

CREATE FUNCTION collections_private.database_name_hash ( name text ) RETURNS bytea AS $EOFCODE$
  SELECT
    DECODE(MD5(LOWER(inflection.plural (name))), 'hex');
$EOFCODE$ LANGUAGE sql IMMUTABLE;

CREATE UNIQUE INDEX databases_database_unique_name_idx ON collections_public.database ( owner_id, collections_private.database_name_hash(name) );

CREATE TABLE collections_public.schema (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	database_id uuid NOT NULL REFERENCES collections_public.database ( id ) ON DELETE CASCADE,
	name text NOT NULL,
	schema_name text NOT NULL,
	description text,
	created_at timestamptz,
	updated_at timestamptz,
	UNIQUE ( database_id, name ),
	UNIQUE ( schema_name ) 
);

ALTER TABLE collections_public.schema ADD CONSTRAINT schema_namechk CHECK ( char_length(name) > 2 );

CREATE TABLE collections_public."table" (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	database_id uuid NOT NULL REFERENCES collections_public.database ( id ) ON DELETE CASCADE,
	schema_id uuid NOT NULL REFERENCES collections_public.schema ( id ) ON DELETE CASCADE,
	name text NOT NULL,
	description text,
	smart_tags jsonb,
	is_system boolean DEFAULT ( FALSE ),
	use_rls boolean NOT NULL DEFAULT ( FALSE ),
	plural_name text,
	singular_name text,
	created_at timestamptz,
	updated_at timestamptz,
	UNIQUE ( database_id, name ) 
);

ALTER TABLE collections_public."table" ADD COLUMN  inherits_id uuid NULL REFERENCES collections_public."table" ( id );

CREATE TABLE collections_public.field (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	database_id uuid NOT NULL REFERENCES collections_public.database ( id ) ON DELETE CASCADE,
	table_id uuid NOT NULL REFERENCES collections_public."table" ( id ) ON DELETE CASCADE,
	name text NOT NULL,
	description text,
	smart_tags jsonb,
	is_required boolean NOT NULL DEFAULT ( FALSE ),
	default_value text NULL DEFAULT ( NULL ),
	is_hidden boolean NOT NULL DEFAULT ( FALSE ),
	type citext NOT NULL,
	field_order int NOT NULL DEFAULT ( 0 ),
	regexp text DEFAULT ( NULL ),
	chk jsonb DEFAULT ( NULL ),
	chk_expr jsonb DEFAULT ( NULL ),
	min pg_catalog.float8 DEFAULT ( NULL ),
	max pg_catalog.float8 DEFAULT ( NULL ),
	created_at timestamptz,
	updated_at timestamptz,
	UNIQUE ( table_id, name ) 
);

CREATE UNIQUE INDEX databases_field_uniq_names_idx ON collections_public.field ( table_id, decode(md5(lower(regexp_replace(name, '^(.+?)(_row_id|_id|_uuid|_fk|_pk)$', '\1', 'i'))), 'hex') );

CREATE FUNCTION collections_private.table_name_hash ( name text ) RETURNS bytea AS $EOFCODE$
  SELECT
    DECODE(MD5(LOWER(inflection.plural (name))), 'hex');
$EOFCODE$ LANGUAGE sql IMMUTABLE;

CREATE UNIQUE INDEX databases_table_unique_name_idx ON collections_public."table" ( database_id, collections_private.table_name_hash(name) );