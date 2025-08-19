import gql from 'graphql-tag';

export const ApiQuery = gql`
  query ApiRoot($domain: String!, $subdomain: String) {
    domains(condition: { domain: $domain, subdomain: $subdomain }) {
      nodes {
        api {
          databaseId
          dbname
          roleName
          anonRole
          isPublic
          schemaNamesFromExt: apiExtensions {
            nodes {
              schemaName
            }
          }
          schemaNames: schemataByApiSchemaApiIdAndSchemaId {
            nodes {
              schemaName
            }
          }
          rlsModule {
            privateSchema {
              schemaName
            }
            authenticate
            currentRole
            currentRoleId
          }
          # for now keep this for patches
          apiModules {
            nodes {
              name
              data
            }
          }
        }
      }
    }
  }
`;

export const SiteQuery = gql`
  query Site($domain: String!, $subdomain: String) {
    domains(condition: { domain: $domain, subdomain: $subdomain }) {
      nodes {
        site {
          title
          description
          logo
          favicon
          ogImage
          appleTouchIcon
          app {
            name
            appImage
            appStoreLink
            playStoreLink
          }
          siteThemes {
            nodes {
              theme
            }
          }
          siteModules {
            nodes {
              name
              data
            }
          }
        }
      }
    }
  }
`;
