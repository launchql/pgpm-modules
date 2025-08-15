
import { getConnections as getC } from '@launchql/graphql-testing';

export const getConnections = async (schemas: string[]) => {
  return getC({ schemas, plan: 'launchql.plan' });
};
