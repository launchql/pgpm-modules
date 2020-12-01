-- Revert: schemas/meta_public/tables/apis/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "meta_public".apis
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

