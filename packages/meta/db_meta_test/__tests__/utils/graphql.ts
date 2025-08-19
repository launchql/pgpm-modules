import { getConnections as get } from 'graphile-test';

export const getConnections = async (schemas: string[]) =>
  get({
    authRole: 'administrator',
    schemas
  });
