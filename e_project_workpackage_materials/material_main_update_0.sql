set workpackage_id = select workpackage_id from project_workpackage_materials where material_id=$material_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 
SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_workpackage_materials/material_main_display_4.sql?workpackage_id='||$workpackage_id
ELSE  '/e_project_workpackage_materials/material_main_display_3.sql?workpackage_id='||$workpackage_id
END;

SET material_carbon_footprint =  :product_climate_change_indicator * :material_equiv_fonctional_units ;

UPDATE project_workpackage_materials 
SET 
material_summary=:material_summary,
material_quantity=:material_quantity,
material_unit=:material_unit,
material_status=:material_status,
material_volume1=:material_volume1,
material_volume2=:material_volume2,
material_area=:material_area,
material_length=:material_length,
material_heigth=:material_heigth,
material_width=:material_width,
material_weigth=:material_weigth,
material_thickness=:material_thickness,
material_equiv_fonctional_units=:material_equiv_fonctional_units,
material_carbon_footprint = $material_carbon_footprint,
modified_at = CURRENT_TIMESTAMP

where material_id=$material_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


