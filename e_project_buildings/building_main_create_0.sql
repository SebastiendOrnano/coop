SET user_id = (
    SELECT users.user_id AS UserId FROM users
    INNER JOIN sessions ON sessions.user_id = UserId
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_buildings/building_main_display_4.sql?project_id='||$project_id
ELSE  '/e_project_buildings/building_main_display_3.sql?project_id='||$project_id
END;

INSERT INTO project_buildings
(
	project_id,
	building_name,
	building_status,
	building_summary,
	building_adress,
	building_postal_code,
	building_town,
	building_country,
	building_contact_phone,
	building_contact_mail,
	building_latitude,
	building_longitude,
	building_type,
	building_accessibility,
	building_capacity_seats,
	building_capacity_standup
	)
VALUES 
(
	$project_id,
	:building_name,
	:building_status,
	:building_summary,
	:building_adress,
	:building_postal_code,
	:building_town,
	:building_country,
	:building_contact_phone,
	:building_contact_mail,
	:building_latitude,
	:building_longitude,
	:building_type,
	:building_accessibility,
	:building_capacity_seats,
	:building_capacity_standup
)

-- Get the last inserted topic ID

SET building_id = (SELECT MAX(building_id) FROM project_buildings WHERE building_name = :building_name);

INSERT INTO project_building_rooms
(
room_name,
building_id,
room_status, 
room_level,
room_type,
room_accessibility,
room_capacity_seats,
room_capacity_standup
)
SELECT
:building_name,
$building_id,
'active',
'main',
'main_building',
:building_accessibility,
:building_capacity_seats,
:building_capacity_standup

WHERE :building_name IS NOT NULL

RETURNING 'redirect' AS component,
$redirect_link  AS link;


