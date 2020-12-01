-- Verify: schemas/meta_public/tables/apis/policies/authenticated_can_select_on_apis on pg

BEGIN;
SELECT verify_policy('authenticated_can_select_on_apis', 'meta_public.apis');
COMMIT;  

