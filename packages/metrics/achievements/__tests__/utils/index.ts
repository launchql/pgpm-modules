import { getConnections as getC } from '@launchql/db-testing';
export const getConnections = async () => getC(['status_public', 'status_private'], { plan: 'launchql.plan' });
