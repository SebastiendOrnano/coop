SET building_id = SELECT building_id FROM project_building_rooms WHERE room_id = $room_id;
SET project_id = select project_id from project_building where building_id=$building_id;

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


INSERT INTO project_building_rooms_pictures 
( 
project_id,
building_id,
room_id,
room_picture_title,
room_picture_status,
room_picture_format,
room_picture_url,
room_picture_summary
)

SELECT
$project_id,
$building_id,
$room_id,
:room_picture_title,
'active',
:room_picture_format, 
sqlpage.persist_uploaded_file('room_picture_url', 'x_pictures_spaces', 'pdf,jpg,jpeg,png,svg,obj'),
:room_picture_summary

WHERE :room_picture_title IS NOT NULL

RETURNING  'redirect' AS component,
$redirect_link AS link;
