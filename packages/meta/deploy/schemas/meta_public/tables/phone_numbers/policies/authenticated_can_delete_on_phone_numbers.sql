-- Deploy: schemas/meta_public/tables/phone_numbers/policies/authenticated_can_delete_on_phone_numbers to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/phone_numbers/table
-- requires: schemas/meta_public/tables/phone_numbers/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_delete_on_phone_numbers ON "meta_public".phone_numbers FOR DELETE TO authenticated USING ( owner_id = "meta_public".get_current_user_id() OR owner_id = ANY( "meta_public".get_current_group_ids() ) );
COMMIT;
