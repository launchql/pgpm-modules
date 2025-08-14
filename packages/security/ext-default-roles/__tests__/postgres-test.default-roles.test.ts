export {};

declare function getConnections(): Promise<{ pg: any; teardown: () => Promise<void> }>;

let pg: any;
let teardown: () => Promise<void>;

describe.skip('default-roles', () => {
  beforeAll(async () => {
    ({ pg, teardown } = await getConnections());
  });

  afterAll(async () => {
    try {
      await teardown();
    } catch (e) {
      console.log(e);
    }
  });

  beforeEach(async () => {
    await pg.beforeEach();
  });

  afterEach(async () => {
    await pg.afterEach();
  });

  it('should have the required roles', async () => {
    const result = await pg.query(`
      SELECT rolname
      FROM pg_roles
      WHERE rolname IN ('authenticated', 'anonymous', 'administrator');
    `);
    expect(result.rows.length).toBeGreaterThan(0);
  });
});
