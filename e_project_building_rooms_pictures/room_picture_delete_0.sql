SET room_id = (select room_id from project_building_rooms_pictures where room_picture_id = $room_picture_id) ;
SET building_id = (select building_id from project_building_rooms where room_id = $room_id) ;
SET project_id = (select project_id from project_buildings where building_id = $building_id) ;

SET room_picture_url= (SELECT room_picture_url FROM project_building_rooms_pictures WHERE  room_picture_id = $room_picture_id);
INSERT INTO files_to_erase (file_url) VALUES ($room_picture_url);


SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_building_rooms_pictures/project_picture_display_4.sql?project_id='||$project_id
ELSE '/e_project_building_rooms_pictures/project_picture_display_4.sql?project_id='||$project_id
END;


DELETE FROM project_building_rooms_pictures WHERE room_picture_id  = $room_picture_id;

select 'redirect' as component,
$redirect_link as link;