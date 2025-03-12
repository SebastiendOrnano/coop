DELETE FROM project_building_rooms
WHERE room_id  = $room_id;

DELETE FROM project_building_rooms sWHERE room_id  = $room_id 
RETURNING
'redirect' AS component,
'/e_project_building_rooms/room_main_display_4.sql' AS link;