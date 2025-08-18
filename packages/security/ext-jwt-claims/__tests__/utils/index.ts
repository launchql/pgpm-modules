import { getConnections as getC } from 'pgsql-test';

export const getConnections = async () => {
  return getC(['jwt_public', 'jwt_private'], { plan: 'launchql.plan' });
};
