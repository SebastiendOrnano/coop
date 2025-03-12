SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET workpackage_id = (select workpackage_id from project_worksequences where worksequence_id = $worksequence_id) ;


select 
    'alert'                    as component,
    'Suppression d''une séquence!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses élements liés ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
'/e_project_worksequences/worksequence_main_delete_0.sql?worksequence_id='||$worksequence_id       as link,
    'Suppression' as title;
select 
'/e_project_worksequences/worksequence_main_display_4.sql?workpackage_id='||$workpackage_id    as link,
    'Retour à la liste' as title,
    'secondary'    as color;



