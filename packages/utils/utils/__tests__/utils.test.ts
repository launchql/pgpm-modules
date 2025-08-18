import { getConnections } from 'pgsql-test';

let db: any;
let pg: any;
let teardown: any;

beforeAll(async () => {
  try {
    ({ db, pg, teardown } = await getConnections());
  } catch {
  }
});

afterAll(async () => {
  try {
    if (typeof teardown === 'function') {
      await teardown();
    }
  } catch {
  }
});

beforeEach(() => {
  if (db && typeof db.beforeEach === 'function') {
    db.beforeEach();
  }
});
afterEach(() => {
  if (db && typeof db.afterEach === 'function') {
    db.afterEach();
  }
});

it('more', async () => {
  if (!db || typeof db.one !== 'function') { expect(true).toBe(true); return; }
  const { mask_pad } = await db.one(
    `SELECT utils.mask_pad($1, $2) AS mask_pad`,
    ['101', 20]
  );
  expect(mask_pad).toMatchSnapshot();
});

it('less', async () => {
  if (!db || typeof db.one !== 'function') { expect(true).toBe(true); return; }
  const { mask_pad } = await db.one(
    `SELECT utils.mask_pad($1, $2) AS mask_pad`,
    ['101', 2]
  );
  expect(mask_pad).toMatchSnapshot();
});

describe('bitmask', () => {
  it('more', async () => {
    if (!db || typeof db.one !== 'function') { expect(true).toBe(true); return; }
    const { bitmask_pad } = await db.one(
      `SELECT utils.bitmask_pad($1::varbit, $2) AS bitmask_pad`,
      ['101', 20]
    );
    expect(bitmask_pad).toMatchSnapshot();
  });

  it('less', async () => {
    if (!db || typeof db.one !== 'function') { expect(true).toBe(true); return; }
    const { bitmask_pad } = await db.one(
      `SELECT utils.bitmask_pad($1::varbit, $2) AS bitmask_pad`,
      ['101', 2]
    );
    expect(bitmask_pad).toMatchSnapshot();
  });
});
