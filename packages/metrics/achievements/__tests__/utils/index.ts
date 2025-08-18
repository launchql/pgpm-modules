import { getConnections as getC } from 'pgsql-test';
export const getConnections = async () => getC(['status_public', 'status_private'], { plan: 'launchql.plan' });
