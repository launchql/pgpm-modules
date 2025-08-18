import { getConnections as getC } from 'graphile-test';

export const getConnections = async () => {
  return getC({ schemas: ['status_public'], plan: 'launchql.plan' });
};
