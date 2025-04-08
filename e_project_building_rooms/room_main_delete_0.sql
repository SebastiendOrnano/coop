SET building_id= SELECT building_id from project_building_rooms where room_id=$room_id;
SET room_picture_url= (SELECT room_picture_url FROM project_building_rooms_pictures WHERE  room_id  = $room_id);
INSERT INTO files_to_erase (file_url) VALUES ($room_picture_url);

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

DELETE FROM project_building_rooms WHERE room_id  = $room_id;

select 'redirect' as component,
$redirect_link as link;