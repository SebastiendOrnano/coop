SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''projet!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous les éléments liés ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;

select 
    '/e_project/project_main_delete_0.sql?project_id='||$project_id        as link,
    'Suppression'                                         as title,
    'alert-circle'                                        as icon,
    'red'                                                 as color;

select 
    '/e_project/project_main_archive_0.sql?project_id='||$project_id       as link,
    'changer le statut'                                as title,
    'alert-circle'                                     as icon,
    'green'                                            as color; 

select 
    '/e_project/project_main_display_4.sql'    as link,
    'Retour à la liste'             as title,
    'arrow_left'                  as icon,
    'orange'                     as color;



