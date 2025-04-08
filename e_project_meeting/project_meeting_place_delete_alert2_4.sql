SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''un lieu!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Il n''est pas possible de supprimer ce lieu car il est utilisé pour une réunion' as description;

select 
'/e_project_meeting/project_meeting_place_display_4.sql'    as link,
    'Retour à la liste' as title,
    'secondary'    as color;



