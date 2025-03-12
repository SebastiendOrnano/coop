SET building_name = (select building_name FROM project_buildings where building_id=$building_id);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_building_rooms/room_main_display_4.sql?building_id='||$building_id
ELSE  '/e_project_building_rooms/room_main_display_3.sql?building_id='||$building_id
END;

INSERT INTO project_building_rooms
(
	building_id,
	room_name,
	room_status,
	room_summary,
	room_todo,
	room_access,
	room_type,
	room_accessibility,
	room_capacity_seats,
	room_capacity_standup,
	room_width,
	room_length,
	room_height,
	room_wall_material,
	room_floor_material
	)
VALUES 
(
	$building_id,
	:room_name,
	'active',
	:room_summary,
	:room_todo,
	:room_access,
	:room_type,
	:room_accessibility,
	:room_capacity_seats,
	:room_capacity_standup,
	:room_width,
	:room_length,
	:room_height,
	:room_wall_material,
	:room_floor_material
)

RETURNING 'redirect' AS component,
$redirect_link  AS link;


