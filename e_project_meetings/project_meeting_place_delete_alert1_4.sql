SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''un lieu!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses élements liés ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
'/e_project_meetings/project_meeting_place_delete_0.sql?project_meeting_place_id='||$project_meeting_place_id       as link,
    'Suppression' as title;
select 
'/e_project_meetings/project_meeting_place_display_4.sql'    as link,
    'Retour à la liste' as title,
    'secondary'    as color;



