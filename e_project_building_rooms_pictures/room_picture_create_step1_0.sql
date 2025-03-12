SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET building_id=:building_id;

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_building_rooms_pictures/room_picture_form_step2_4.sql?building_id='||$building_id
ELSE  '/e_project_building_rooms_pictures/room_picture_form_step2_3.sql?building_id='||$building_id
END;



INSERT INTO project_building_rooms_pictures 
( 
project_id,
building_id
)
SELECT
$project_id,
:building_id

WHERE :building_id IS NOT NULL

RETURNING  'redirect' AS component,
$redirect_link AS link;
