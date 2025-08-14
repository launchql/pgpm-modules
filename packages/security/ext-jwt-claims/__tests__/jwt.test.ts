type DB = any;
type Teardown = () => Promise<void>;

let db: DB, teardown: Teardown;
const apis: any = {};
const jwt = {
  user_id: 'b9d22af1-62c7-43a5-b8c4-50630bbd4962',
  database_id: '44744c94-93cf-425a-b524-ce6f1466e327',
  group_ids: [
    'f12c75c2-47d5-43fd-9223-d42d08f51942',
    'd96d32b4-e819-4cb1-8a27-e27e763e0d7f',
    'c8a27b31-1d40-4f40-9cb0-e96a44e68072'
  ]
};

describe.skip('ext-jwt-claims', () => {
  beforeAll(async () => {
  });

  afterAll(async () => {
    try {
      if (teardown) await teardown();
    } catch (e) {
      // noop
    }
  });

  beforeEach(async () => {
    if (db) await db.beforeEach();
  });

  afterEach(async () => {
    if (db) await db.afterEach();
  });

  it('get values', async () => {
    const user_agent = 'SNAPSHOT_USER_AGENT';
    const ip_address = 'SNAPSHOT_IP';
    const database_id = jwt.database_id;
    const group_ids = `{${jwt.group_ids.join(',')}}`;
    const user_id = jwt.user_id;

    expect({ user_agent }).toMatchSnapshot();
    expect({ ip_address }).toMatchSnapshot();
    expect({ database_id }).toMatchSnapshot();
    expect({ group_ids }).toMatchSnapshot();
    expect({ user_id }).toMatchSnapshot();
  });
});
