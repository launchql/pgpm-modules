-- Revert: schemas/meta_public/tables/users/alterations/alt0000000006 from pg

BEGIN;


ALTER TABLE "meta_public".users
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

