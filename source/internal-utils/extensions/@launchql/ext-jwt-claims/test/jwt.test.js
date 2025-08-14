import { getConnections } from './utils';

let db, teardown;
const apis = {};
const jwt = {
  user_id: 'b9d22af1-62c7-43a5-b8c4-50630bbd4962',
  database_id: '44744c94-93cf-425a-b524-ce6f1466e327',
  group_ids: [
    'f12c75c2-47d5-43fd-9223-d42d08f51942',
    'd96d32b4-e819-4cb1-8a27-e27e763e0d7f',
    'c8a27b31-1d40-4f40-9cb0-e96a44e68072'
  ]
};
beforeAll(async () => {
  ({ db, teardown } = await getConnections());
  apis.public = db.helper('jwt_public');
  apis.private = db.helper('jwt_private');
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

it('get values', async () => {
  db.setContext({
    'jwt.claims.user_agent':
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',
    'jwt.claims.ip_address': '127.0.0.1',
    'jwt.claims.database_id': jwt.database_id,
    'jwt.claims.user_id': jwt.user_id,
    'jwt.claims.group_ids': `{${jwt.group_ids.join(',')}}`
  });
  const user_agent = await apis.public.call('current_user_agent');
  const ip_address = await apis.public.call('current_ip_address');
  const database_id = await apis.private.call('current_database_id');
  const group_ids = await apis.public.call('current_group_ids');
  const user_id = await apis.public.call('current_user_id');
  expect({ user_agent }).toMatchSnapshot();
  expect({ ip_address }).toMatchSnapshot();
  expect({ database_id }).toMatchSnapshot();
  expect({ group_ids }).toMatchSnapshot();
  expect({ user_id }).toMatchSnapshot();
});
