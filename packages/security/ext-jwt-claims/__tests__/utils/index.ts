import { getConnections as getC } from '@launchql/db-testing';

export const getConnections = async () => {
  return getC(['jwt_public', 'jwt_private'], { plan: 'launchql.plan' });
};
