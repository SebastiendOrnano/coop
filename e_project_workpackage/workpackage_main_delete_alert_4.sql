SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_id = (select project_id from project_workpackage where workpackage_id = $workpackage_id) ;


select 
    'alert'                    as component,
    'Suppression d''une workpackage!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses élements liés ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
'/e_project_workpackage/workpackage_main_delete_0.sql?workpackage_id='||$workpackage_id       as link,
    'Suppression' as title;
select 
'/e_project/project_hub_display_4.sql?project_id='||$project_id    as link,
    'Retour à la liste' as title,
    'secondary'    as color;



