
import { getConnections as getC } from '@launchql/db-testing';
export const getConnections = async () => getC(['measurements'], { plan: 'launchql.plan' });
