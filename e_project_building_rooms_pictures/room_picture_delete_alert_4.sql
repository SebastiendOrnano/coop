SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET room_id = (select room_id from project_building_rooms_pictures where room_picture_id = $room_picture_id) ;
SET building_id = (select building_id from project_building_rooms where room_id = $room_id) ;
SET project_id = (select project_id from project_buildings where building_id = $building_id) ;

select 
    'alert'                    as component,
    'Suppression d''une image!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression est irréversible! Par prudence, il vaut mieux choisir le statut ''archivé''  ' as description;

select 
    '/e_project_building_rooms_pictures/room_picture_delete_0.sql?room_picture_id='||$room_picture_id      as link,   
    'Suppression'                                                                                          as title;

select 
    '/e_project_building_rooms_pictures/project_picture_display_4.sql?project_id='||$project_id  as link,
    'Retour à la liste'                                                                          as title,
    'secondary'                                                                                  as color;



