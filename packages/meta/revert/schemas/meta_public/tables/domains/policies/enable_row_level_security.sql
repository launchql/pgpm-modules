-- Revert: schemas/meta_public/tables/domains/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".domains
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

