import { getConnections, PgTestClient } from 'pgsql-test';

let db: any, dbs: any, teardown: () => Promise<void>;
const objs: any = {
  tables: {}
};

beforeAll(async () => {
  ({ db, teardown } = await getConnections());
  dbs = db.helper('yourschema');
});

afterAll(async () => {
  try {
    await teardown();
  } catch (e) {
  }
});

beforeEach(async () => {
  await db.beforeEach();
});

afterEach(async () => {
  await db.afterEach();
});

beforeEach(async () => {
  await db.any(`
  insert into secrets_schema.secrets_table
( secrets_owned_field,
  name,
  secrets_value_field,
  secrets_enc_field
) values
(
'dc474833-318a-41f5-9239-ee563ab657a6',
'my-secret-name',
'my-secret',
'pgp'
)
;
  `);
});

it('encrypt_field_pgp_get', async () => {
  const [{ encrypt_field_pgp_get }] = await db.any(
    `SELECT encrypted_secrets.encrypt_field_pgp_get(secrets_value_field, secrets_owned_field::text) FROM secrets_schema.secrets_table`
  );
  expect(encrypt_field_pgp_get).toMatchSnapshot();
});

it('encrypt_field_set', async () => {
  const [{ encrypt_field_set }] = await db.any(
    `SELECT encrypted_secrets.encrypt_field_set('myvalue')`
  );
  expect(encrypt_field_set).toMatchSnapshot();
});

it('encrypt_field_bytea_to_text', async () => {
  const [{ encrypt_field_bytea_to_text }] = await db.any(
    `SELECT encrypted_secrets.encrypt_field_bytea_to_text(
      encrypted_secrets.encrypt_field_set('value-there-and-back')
    )`
  );
  expect(encrypt_field_bytea_to_text).toMatchSnapshot();
});

it('secrets_getter', async () => {
  const [{ secrets_getter }] = await db.any(
    `SELECT encrypted_secrets.secrets_getter(
      'dc474833-318a-41f5-9239-ee563ab657a6',
        'my-secret-name'
      );`
  );
  expect(secrets_getter).toMatchSnapshot();
});

it('secrets_verify', async () => {
  const [{ secrets_verify }] = await db.any(
    `SELECT encrypted_secrets.secrets_verify(
      'dc474833-318a-41f5-9239-ee563ab657a6',
        'my-secret-name',
        'my-secret'
      );`
  );
  expect(secrets_verify).toMatchSnapshot();
});

it('secrets_upsert', async () => {
  const [{ secrets_upsert }] = await db.any(
    `SELECT encrypted_secrets.secrets_upsert(
      'dc474833-318a-41f5-9239-ee563ab657a6',
        'my-secret-name',
        'my-secret-other-value'
      );`
  );
  expect(secrets_upsert).toMatchSnapshot();
  const [{ secrets_verify }] = await db.any(
    `SELECT encrypted_secrets.secrets_verify(
      'dc474833-318a-41f5-9239-ee563ab657a6',
        'my-secret-name',
        'my-secret-other-value'
      );`
  );
  expect(secrets_verify).toMatchSnapshot();
});

xit('encrypt_field_pgp_getter', async () => {
  const [{ encrypt_field_pgp_getter }] = await db.any(
    `SELECT encrypted_secrets.encrypt_field_pgp_getter(
      'dc474833-318a-41f5-9239-ee563ab657a6',
        'secrets_value_field',
        'secrets_enc_field'
      );`
  );
  expect(encrypt_field_pgp_getter).toMatchSnapshot();
});

xit('secrets_table_upsert', async () => {
  const [{ secrets_table_upsert }] = await db.any(
    `SELECT encrypted_secrets.secrets_table_upsert(
      'dc474833-318a-41f5-9239-ee563ab657a6',
        $1::json
      );`,
    [
      JSON.stringify({
        myOther: 'secret',
        hiOther: 'here'
      })
    ]
  );
  expect(secrets_table_upsert).toMatchSnapshot();
});
