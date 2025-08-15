import { getConnections as getC } from '@launchql/graphql-testing';

export const getConnections = async () => {
  return getC({ schemas: ['status_public'], plan: 'launchql.plan' });
};
