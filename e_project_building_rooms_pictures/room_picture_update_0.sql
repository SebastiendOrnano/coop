SET room_id = SELECT room_id FROM project_building_rooms_pictures WHERE room_picture_id = $room_picture_id;
SET building_id = SELECT building_id FROM project_building_rooms WHERE room_id = $room_id;
SET project_id = (select project_id from project_building where building_id = $building_id) ;


SET room_picture_url = sqlpage.persist_uploaded_file('room_picture_url', 'x_pictures_spaces', 'doc,docx,odt,md,pdf,jpg,jpeg,png');
SET room_picture_url_old = SELECT room_picture_url FROM project_building_rooms_pictures WHERE room_picture_id=$room_picture_id;
SET room_picture_url_old_to_erase = CASE WHEN $room_picture_url IS NOT NULL OR $room_picture_url !='' THEN $room_picture_url_old ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($room_picture_url_old_to_erase);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_building_rooms_pictures/room_picture_display_4.sql?room_id='||$room_id
ELSE  '/e_project_building_rooms_pictures/room_picture_display_3.sql?room_id='||$room_id
END;

UPDATE project_building_rooms_pictures 
SET 
room_picture_title=:room_picture_title,
room_picture_status=:room_picture_status,
room_picture_format=:room_picture_format,
room_picture_url =
CASE  
WHEN $room_picture_url IS NULL OR $room_picture_url ='' THEN room_picture_url
ELSE $room_picture_url
END,
room_picture_summary=:room_picture_summary,
modified_at = CURRENT_TIMESTAMP

WHERE room_picture_id=$room_picture_id

RETURNING  'redirect' AS component,
$redirect_link AS link;