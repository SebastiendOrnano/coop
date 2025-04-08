SET workpackage_id = select workpackage_id from workpackage where project_id  = $project_id;
SET worksequence_id = select workworksequence_id from workpsequences where workpackage_id  = $workpackage_id;

SET building_id = select building_id from project_building where project_id  = $project_id;
SET room_id = select room_id from project_building_rooms where building_id = $building_id;

SET project_doc_url= (SELECT project_doc_url  FROM project_docs WHERE  project_id = $project_id);
INSERT INTO files_to_erase (file_url) VALUES ($project_doc_url);

SET room_picture_url= (SELECT room_picture_url FROM project_building_rooms_pictures WHERE  room_id = $room_id);
INSERT INTO files_to_erase (file_url) VALUES ($room_picture_url);

DELETE FROM project_worksequence_participants
WHERE worksequence_id  = $worksequence_id;

DELETE FROM project_worksequence
WHERE workpackage_id  = $workpackage_id;

DELETE FROM project_workpackage_participants
WHERE workpackage_id  = $workpackage_id;

DELETE FROM project_workpackage
WHERE project_id  = $project_id;

DELETE FROM project_building_rooms_pictures
WHERE room_id  = $room_id;

DELETE FROM project_building_rooms
WHERE building_id  = $building_id;

DELETE FROM project_building
WHERE project_id  = $project_id;

DELETE FROM project_doc
WHERE project_id  = $project_id;

DELETE FROM project_sprints
WHERE project_id  = $project_id;

DELETE FROM project_participants
WHERE project_id  = $project_id

DELETE FROM project
WHERE project_id  = $project_id

RETURNING
'redirect' AS component,
'/e_project/project_main_display_4.sql' AS link;