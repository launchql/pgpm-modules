
import { getConnections as getC } from 'graphile-test';

export const getConnections = async (schemas: string[]) => {
  return getC({ schemas, plan: 'launchql.plan' });
};
