import { getConnections } from './utils';

let teardown: () => Promise<void>, conn: any;

describe('signup', () => {
  beforeAll(async () => {
    ({ db: conn, teardown } = await getConnections());
  });
  afterAll(async () => {
    await teardown();
  });
  describe('has a database', () => {
    it('schema exists', async () => {
      const res = await conn.any(
        "SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'measurements'"
      );
      expect(Array.isArray(res)).toBe(true);
      expect(res.length).toBe(1);
      expect(res[0].schema_name).toBe('measurements');
    });
  });
});
