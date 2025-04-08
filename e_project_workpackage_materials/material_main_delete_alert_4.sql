SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;
set workpackage_id = select workpackage_id from project_workpackage_materials where material_id=$material_id;
select 
    'alert'                    as component,
    'Suppression d''un materiau' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses élements liés ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
    '/e_project_workpackage_materials/material_main_delete_0.sql?material_id='||$material_id     as link,
    'Suppression' as title;
select 
    '/e_project_workpackage_materials/material_main_display_4.sql?workpackage_id='||$workpackage_id  as link,
    'Retour à la liste' as title,
    'secondary'    as color;




