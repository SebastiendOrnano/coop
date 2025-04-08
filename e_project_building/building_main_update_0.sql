SET project_id=select project_id from project_building where building_id=$building_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET suffix_role = 
(
	    SELECT
        CASE
            WHEN $user_role = "supervisor" THEN '_4.sql'
            WHEN $user_role = "editor" THEN '_3.sql'
        END
);
  
SET redirect_link = '/e_project_building/building_main_display'||$suffix_role||'?project_id='||$project_id;

UPDATE project_building 
SET 
building_name=:building_name,
building_status=:building_status,
building_summary=:building_summary,
building_adress=:building_adress,
building_postal_code=:building_postal_code, 
building_town=:building_town,
building_country=:building_country,
building_contact_phone=:building_contact_phone,
building_contact_mail=:building_contact_mail,
building_latitude=:building_latitude, 
building_longitude=:building_longitude,
building_type = :building_type,
building_accessibility=:building_accessibility,
building_capacity_seats=:building_capacity_seats,
building_capacity_standup=:building_capacity_standup,
modified_at = CURRENT_TIMESTAMP
WHERE building_id = $building_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


