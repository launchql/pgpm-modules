-- Deploy: schemas/meta_public/tables/apis/indexes/apis_domain_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apis/table

BEGIN;

CREATE INDEX apis_domain_id_idx ON "meta_public".apis (domain_id);
COMMIT;
