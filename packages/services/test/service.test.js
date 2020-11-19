import { getConnections } from './utils';
import { snap } from './utils/snaps';

let db, dbs, teardown;
const objs = {
  tables: {}
};

beforeAll(async () => {
  ({ db, teardown } = await getConnections());
  dbs = db.helper('services_public');
});

afterAll(async () => {
  try {
    //try catch here allows us to see the sql parsing issues!
    await teardown();
  } catch (e) {
    // noop
  }
});

beforeEach(async () => {
  await db.beforeEach();
});

afterEach(async () => {
  await db.afterEach();
});

it('add_renderer', async () => {
  const results = await dbs.call('add_renderer', {
    subdomain: 'subdomain',
    domain: 'domain',
    dbname: 'mydatabase'
  });
  snap(results);
});

it('add_api_service', async () => {
  const results = await dbs.call('add_api_service', {
    subdomain: 'subdomain',
    domain: 'domain',
    dbname: 'mydatabase',
    role_name: 'postgres',
    anon_role: 'public',
    schemas: ['schema_public', 'schema_private']
  });
  snap(results);
  await (async () => {
    const results = await dbs.call(
      'add_plugin',
      {
        subdomain: 'subdomain',
        domain: 'domain',
        name: 'authenticate',
        data: JSON.stringify({
          schema: 'dashboard_private',
          function: 'authenticate'
        })
      },
      {
        data: 'jsonb'
      }
    );
    snap(results);
  })();
});

it('plugins', async () => {
  await dbs.call('add_renderer', {
    subdomain: 'subdomain',
    domain: 'domain',
    dbname: 'mydatabase'
  });
  await (async () => {
    const results = await dbs.call(
      'add_plugin',
      {
        subdomain: 'subdomain',
        domain: 'domain',
        name: 'verify_email',
        data: JSON.stringify({
          schema: 'dashboard_public',
          function: 'verify_email'
        })
      },
      {
        data: 'jsonb'
      }
    );
    snap(results);
  })();
  await (async () => {
    const results = await dbs.call(
      'add_plugin',
      {
        subdomain: 'subdomain',
        domain: 'domain',
        name: 'multi_factor',
        data: JSON.stringify({
          schema: 'dashboard_private',
          function: 'verify_2fa'
        })
      },
      {
        data: 'jsonb'
      }
    );
    snap(results);
  })();
  await (async () => {
    const results = await dbs.call('remove_plugin', {
      subdomain: 'subdomain',
      domain: 'domain',
      name: 'verify_email'
    });
    snap(results);
  })();
});
