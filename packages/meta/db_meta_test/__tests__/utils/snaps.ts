const uuidRegexp = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
const idReplacement = (v: any) => (!v ? v : '[ID]');

export const pruneDates = (row: any) =>
  mapValues(row, (v, k) => {
    if (!v) {
      return v;
    }
    if (v instanceof Date) {
      return '[DATE]';
    } else if (
      typeof v === 'string' &&
      (k as string).match(/(_at|At)$/) &&
      (v as string).match(/^20[0-9]{2}-[0-9]{2}-[0-9]{2}/)
    ) {
      return '[DATE]';
    }
    return v;
  });
const mapValues = (objs: any, fn: any) =>
  Object.entries(objs).reduce((a: any, [key, value]) => {
    a[key] = fn(value, key);
    return a;
  }, {} as any);

export const pruneIds = (row: any) =>
  mapValues(row, (v, k) =>
    ((k as string) === 'id' || (k as string).endsWith('_id') || (k as string).endsWith('Id')) &&
    (typeof v === 'string' || typeof v === 'number')
      ? idReplacement(v)
      : v
  );

export const pruneIdArrays = (row: any) =>
  mapValues(row, (v, k) =>
    (k as string).endsWith('_ids') && Array.isArray(v) ? `[UUIDs-${(v as any[]).length}]` : v
  );

export const pruneUUIDs = (row: any) =>
  mapValues(row, (v, k) => {
    if (typeof v !== 'string') {
      return v;
    }
    const val = v;
    return (['uuid', 'queue_name'] as string[]).includes(k as string) && (v as string).match(uuidRegexp)
      ? '[UUID]'
      : (k as string) === 'gravatar' && val.match(/^[0-9a-f]{32}$/i)
      ? '[gUUID]'
      : v;
  });
export const pruneTokens = (row: any) =>
  mapValues(row, (v, k) =>
    ((k as string) === 'token' || (k as string).endsWith('_token')) && typeof v === 'string'
      ? '[token]'
      : v
  );

export const pruneHashes = (row: any) =>
  mapValues(row, (v, k) =>
    (k as string).endsWith('_hash') && typeof v === 'string' && (v as string)[0] === '$' ? '[hash]' : v
  );

export const prunePeoplestamps = (row: any) =>
  mapValues(row, (v, k) =>
    (k as string).endsWith('_by') && typeof v === 'string' ? '[peoplestamp]' : v
  );

export const pruneSchemas = (row: any) =>
  mapValues(row, (v, k) =>
    typeof v === 'string' && /^zz-/.test(v) ? '[schemahash]' : v
  );

export const testdbs = (row: any) =>
  mapValues(row, (v, k) =>
    typeof v === 'string' && /^testing-db-/.test(v) ? '[testingdb]' : v
  );

export const prune = (obj: any) =>
  testdbs(
    pruneHashes(
      pruneUUIDs(
        pruneIds(
          pruneIdArrays(
            pruneDates(pruneSchemas(pruneTokens(prunePeoplestamps(obj))))
          )
        )
      )
    )
  );

export const snapshot = (obj: any): any => {
  if (Array.isArray(obj)) {
    return obj.map(snapshot);
  } else if (obj && typeof obj === 'object') {
    return mapValues(prune(obj), snapshot);
  }
  return obj;
};

export const snap = (obj: any) => {
  expect(snapshot(obj)).toMatchSnapshot();
};
