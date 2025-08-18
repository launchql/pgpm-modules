
import { getConnections as getC } from 'pgsql-test';
export const getConnections = async () => getC(['measurements'], { plan: 'launchql.plan' });
