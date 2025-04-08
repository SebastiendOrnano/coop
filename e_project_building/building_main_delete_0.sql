set project_id = select project_id from project_building where building_id = $building_id;


DELETE FROM project_building_rooms_pictures
WHERE building_id  = $building_id;

DELETE FROM project_building_rooms
WHERE building_id  = $building_id;

DELETE FROM project_building WHERE building_id  = $building_id 
RETURNING
'redirect' AS component,
'/e_project_building/building_main_display_4.sql?project_id='||project_id AS link;