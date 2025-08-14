export {};

declare function getConnections(): Promise<{ db: any; pg: any; teardown: () => Promise<void> }>;

let db: any;
let pg: any;
let teardown: () => Promise<void>;

describe.skip('utils sql', () => {
  beforeAll(async () => {
    ({ db, pg, teardown } = await getConnections());
  });

  afterAll(async () => {
    try {
      await teardown();
    } catch (e) {
      // noop
      console.log(e);
    }
  });

  beforeEach(() => db.beforeEach());
  afterEach(() => db.afterEach());

  it('more', async () => {
    const { mask_pad } = await db.one(
      `SELECT utils.mask_pad($1, $2) AS mask_pad`,
      ['101', 20]
    );
    expect(mask_pad).toMatchSnapshot();
  });

  it('less', async () => {
    const { mask_pad } = await db.one(
      `SELECT utils.mask_pad($1, $2) AS mask_pad`,
      ['101', 2]
    );
    expect(mask_pad).toMatchSnapshot();
  });

  describe('bitmask', () => {
    it('more', async () => {
      const { bitmask_pad } = await db.one(
        `SELECT utils.bitmask_pad($1::varbit, $2) AS bitmask_pad`,
        ['101', 20]
      );
      expect(bitmask_pad).toMatchSnapshot();
    });

    it('less', async () => {
      const { bitmask_pad } = await db.one(
        `SELECT utils.bitmask_pad($1::varbit, $2) AS bitmask_pad`,
        ['101', 2]
      );
      expect(bitmask_pad).toMatchSnapshot();
    });
  });
});
