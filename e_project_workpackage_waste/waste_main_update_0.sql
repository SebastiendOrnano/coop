
set workpackage_id = select workpackage_id from project_workpackage_waste where waste_id=$waste_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 
SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_workpackage_waste/waste_main_display_4.sql?workpackage_id='||$workpackage_id
ELSE  '/e_project_workpackage_waste/waste_main_display_3.sql?workpackage_id='||$workpackage_id
END;

UPDATE project_workpackage_waste 
SET 
waste_name=:waste_name,
waste_status=:waste_status,
waste_summary=:waste_summary,
waste_category_id=:waste_category_id,
waste_destination=:waste_destination,
waste_unit=:waste_unit,
waste_quantity=:waste_quantity,
waste_functional_unit=:waste_functional_unit,
waste_ienes_url=:waste_ienes_url,
waste_value=:waste_value,
recipiend_id=:recipiend_id,
modified_at = CURRENT_TIMESTAMP

WHERE waste_id = $waste_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


