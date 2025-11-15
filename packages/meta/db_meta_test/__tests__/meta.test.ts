import { getConnections, snapshot } from 'graphile-test';
import type { GraphQLQueryFn } from 'graphile-test';
import type { PgTestClient } from 'pgsql-test';
import { ApiQuery, SiteQuery } from './utils/gql';

// Type definitions for GraphQL query results
interface ApiResult {
  domains: {
    nodes: Array<{
      api: {
        databaseId: string;
        dbname: string;
        roleName: string;
        anonRole: string;
        isPublic: boolean;
        schemaNamesFromExt: {
          nodes: Array<{
            schemaName: string;
          }>;
        };
        schemaNames: {
          nodes: Array<{
            schemaName: string;
          }>;
        };
        rlsModule?: {
          privateSchema: {
            schemaName: string;
          };
          authenticate: boolean;
          currentRole: string;
          currentRoleId: string;
        };
        apiModules: {
          nodes: Array<{
            name: string;
            data: any;
          }>;
        };
      };
    }>;
  };
}

interface SiteResult {
  domains: {
    nodes: Array<{
      site: {
        title: string;
        description: string;
        logo?: string;
        favicon?: string;
        ogImage?: string;
        appleTouchIcon?: string;
        app?: {
          name: string;
          appImage?: string;
          appStoreLink?: string;
          playStoreLink?: string;
        };
        siteThemes: {
          nodes: Array<{
            theme: string;
          }>;
        };
        siteModules: {
          nodes: Array<{
            name: string;
            data: any;
          }>;
        };
      };
    }>;
  };
}

interface QueryVariables {
  domain: string;
  subdomain: string;
}

// Helper function to normalize dynamic database values for consistent snapshots
const normalizeApiResult = (result: ApiResult): ApiResult => {
  return {
    domains: {
      nodes: result.domains.nodes.map(domain => ({
        api: {
          ...domain.api,
          databaseId: 'test-database-id',
          dbname: 'test-database-name',
          // Sort schema arrays to ensure consistent ordering
          schemaNamesFromExt: {
            nodes: [...domain.api.schemaNamesFromExt.nodes].sort((a, b) => 
              a.schemaName.localeCompare(b.schemaName)
            )
          },
          schemaNames: {
            nodes: [...domain.api.schemaNames.nodes].sort((a, b) => 
              a.schemaName.localeCompare(b.schemaName)
            )
          },
          // Sort apiModules array to ensure consistent ordering
          apiModules: {
            nodes: [...domain.api.apiModules.nodes].sort((a, b) => 
              a.name.localeCompare(b.name)
            )
          }
        }
      }))
    }
  };
};

const normalizeSiteResult = (result: SiteResult): SiteResult => {
  return result; // Sites don't have dynamic database fields to normalize
};

let db: PgTestClient;
let pg: PgTestClient;
let query: GraphQLQueryFn;
let teardown: () => Promise<void>;

beforeAll(async () => {
  ({ db, pg, query, teardown } = await getConnections({
    schemas: ['collections_public', 'meta_public'],
    authRole: 'authenticated'
  }));
  
  // Grant permissions to authenticated role for GraphQL access
  await pg.any(`
    GRANT SELECT ON ALL TABLES IN SCHEMA meta_public TO authenticated;
    GRANT SELECT ON ALL TABLES IN SCHEMA collections_public TO authenticated;
  `);
});

afterAll(async () => {
  await teardown();
});

it('api', async () => {
  const result = await query<ApiResult, QueryVariables>(ApiQuery, {
    subdomain: 'api',
    domain: 'pgpm.io'
  });
  
  expect(result.data).toBeDefined();
  expect(snapshot(normalizeApiResult(result.data))).toMatchSnapshot();
});

it('meta', async () => {
  const result = await query<ApiResult, QueryVariables>(ApiQuery, {
    subdomain: 'meta',
    domain: 'pgpm.io'
  });
  
  expect(result.data).toBeDefined();
  expect(snapshot(normalizeApiResult(result.data))).toMatchSnapshot();
});

it('site', async () => {
  const result = await query<SiteResult, QueryVariables>(SiteQuery, {
    subdomain: 'app',
    domain: 'pgpm.io'
  });
  
  expect(result.data).toBeDefined();
  expect(snapshot(normalizeSiteResult(result.data))).toMatchSnapshot();
});
