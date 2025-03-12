SET building_id = (select building_id from project_building_rooms where room_id=$room_id);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_building_rooms/room_main_display_4.sql?building_id='||$building_id||'&project_id='||$project_id
ELSE  '/e_project_building_rooms/room_main_display_3.sql?building_id='||$building_id||'&project_id='||$project_id
END;


UPDATE project_building_rooms 
SET 
room_name=:room_name,
room_level=:room_level,
room_status=:room_status,
room_summary=:room_summary,
room_todo=:room_todo,
room_access=:room_access,
room_type = :room_type,
room_accessibility=:room_accessibility,
room_capacity_seats=:room_capacity_seats,
room_capacity_standup=:room_capacity_standup,
room_width=:room_width,
room_length=:room_length,
room_height=:room_height,
room_wall_material=:room_wall_material,
room_floor_material=:room_floor_material,
modified_at = CURRENT_TIMESTAMP
WHERE room_id = $room_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


